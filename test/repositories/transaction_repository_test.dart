import 'package:flutter_test/flutter_test.dart';
import 'package:spend_arc/data/repositories/transaction_repository_impl.dart';
import 'package:spend_arc/data/local/transaction_local_datasource.dart';
import 'package:spend_arc/data/models/transaction_dto.dart';
import 'package:spend_arc/domain/models/transaction.dart';
import 'package:spend_arc/utilities/resource.dart';

class MockDataSource implements TransactionLocalDataSource {
  List<TransactionDto> data = [];

  @override
  Future<List<TransactionDto>> getTransactions() async => data;

  @override
  Future<void> addTransaction(TransactionDto transaction) async {
    data.add(transaction);
  }

  @override
  Future<void> deleteTransaction(String id) async {
    data.removeWhere((t) => t.id == id);
  }

  @override
  Future<void> clearAll() async {
    data.clear();
  }
}

void main() {
  late MockDataSource dataSource;
  late TransactionRepositoryImpl repository;

  setUp(() {
    dataSource = MockDataSource();
    repository = TransactionRepositoryImpl(dataSource);
  });

  test('Unit Test 4: Repository background sync yields data', () async {
    final t1 = TransactionDto(id: '1', amount: 10, category: 'Test', date: DateTime.now());
    dataSource.data.add(t1);

    final stream = repository.getTransactions();
    
    await expectLater(
      stream,
      emitsInOrder([
        predicate<Resource>((r) => r.maybeWhen(loading: () => true, orElse: () => false)),
        predicate<Resource>((r) => r.maybeWhen(content: (data) => (data as List).length == 1, orElse: () => false)),
      ]),
    );
  });

  test('Unit Test 5: Diff queue sync mechanism stores locally', () async {
    final t2 = Transaction(id: '2', amount: 20, category: 'Test2', date: DateTime.now());
    
    final addStream = repository.addTransaction(t2);
    await addStream.toList(); // Execute stream
    
    expect(dataSource.data.length, 1);
  });
}
