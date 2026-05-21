import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spend_arc/domain/models/transaction.dart';
import 'package:spend_arc/domain/repositories/transaction_repository.dart';
import 'package:spend_arc/features/transactions/transaction_event.dart';
import 'package:spend_arc/features/transactions/transaction_state.dart';
import 'package:spend_arc/features/transactions/transaction_view_model.dart';
import 'package:spend_arc/l10n/l10n_keys.dart';
import 'package:spend_arc/utilities/resource.dart';

class MockTransactionRepository implements TransactionRepository {
  final StreamController<Resource<List<Transaction>>> _controller =
      StreamController.broadcast();

  bool shouldFail = false;

  @override
  Stream<Resource<List<Transaction>>> getTransactions() => _controller.stream;

  @override
  Stream<Resource<void>> addTransaction(Transaction transaction) async* {
    if (shouldFail) {
      yield const Resource.error(L10nKeys.failedToAdd);
    } else {
      yield const Resource.content(null);
    }
  }

  @override
  Stream<Resource<void>> deleteTransaction(String id) async* {
    if (shouldFail) {
      yield const Resource.error(L10nKeys.failedToDelete);
    } else {
      yield const Resource.content(null);
    }
  }

  @override
  Stream<Resource<void>> clearAll() async* {
    yield const Resource.content(null);
    _controller.add(const Resource.content([]));
  }

  void pushMockData(List<Transaction> data) {
    _controller.add(Resource.content(data));
  }
}

NotifierProvider<TransactionViewModel, TransactionState> testTransactionProvider(
  MockTransactionRepository repository,
) {
  return NotifierProvider<TransactionViewModel, TransactionState>(
    () => TransactionViewModel(repository),
  );
}

void main() {
  late MockTransactionRepository repository;
  late ProviderContainer container;

  setUp(() {
    repository = MockTransactionRepository();
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  test('Unit Test 1: ViewModel Add Transaction - Optimistic Update Success', () async {
    final provider = testTransactionProvider(repository);
    final viewModel = container.read(provider.notifier);
    container.read(provider);

    viewModel.onEvent(OnAddTransaction(amount: 10.0, category: 'Food'));

    expect(container.read(provider).transactions.length, 1);
    expect(container.read(provider).transactions.first.amount, 10.0);
  });

  test('Unit Test 2: ViewModel Add Transaction - Optimistic Rollback on Error', () async {
    repository.shouldFail = true;
    final provider = testTransactionProvider(repository);
    final viewModel = container.read(provider.notifier);
    container.read(provider);

    viewModel.onEvent(OnAddTransaction(amount: 10.0, category: 'Food'));
    expect(container.read(provider).transactions.length, 1);

    await Future.delayed(const Duration(milliseconds: 100));

    expect(container.read(provider).transactions.length, 0);
    expect(container.read(provider).error, L10nKeys.failedToAdd);
  });

  test('Unit Test 3: ViewModel Delete Transaction - Optimistic Success', () async {
    final provider = testTransactionProvider(repository);
    final viewModel = container.read(provider.notifier);
    container.read(provider);

    final t = Transaction(
      id: '1',
      amount: 50,
      category: 'Test',
      date: DateTime.now(),
    );

    await Future.microtask(() {});
    repository.pushMockData([t]);
    await Future.microtask(() {});
    expect(container.read(provider).transactions.length, 1);

    viewModel.onEvent(OnDeleteTransaction(id: '1'));

    expect(container.read(provider).transactions.length, 0);
  });
}
