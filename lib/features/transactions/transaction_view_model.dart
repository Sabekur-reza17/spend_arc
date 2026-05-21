import 'dart:async';
import 'package:injectable/injectable.dart';
import '../../core/base_view_model.dart';
import '../../domain/models/transaction.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../l10n/l10n_keys.dart';
import '../../utilities/resource.dart';
import 'transaction_event.dart';
import 'transaction_state.dart';

@injectable
class TransactionViewModel extends BaseViewModel<TransactionState> {
  final TransactionRepository transactionRepository;

  TransactionViewModel(this.transactionRepository) : super();

  @override
  TransactionState build() {
    ref.onDispose(() {
      dispose();
    });
    // Kick off initial load
    Future.microtask(() => onEvent(OnLoadTransactions()));
    return TransactionState();
  }

  void onEvent(TransactionEvent event) {
    switch (event) {
      case OnLoadTransactions():
        _loadTransactions();
        break;
      case OnAddTransaction event:
        _addTransaction(event.amount, event.category);
        break;
      case OnDeleteTransaction event:
        _deleteTransaction(event.id);
        break;
      case OnClearAllTransactions():
        _clearAll();
        break;
    }
  }

  void _loadTransactions() {
    bag.add(
      transactionRepository.getTransactions().listen((resource) {
        resource.when(
          loading: () {
            if (!ref.mounted) return;
            setState((state) => state.copyWith(isLoading: true, error: null));
          },
          content: (List<Transaction> data) {
            if (!ref.mounted) return;
            setState((state) => state.copyWith(isLoading: false, transactions: data));
          },
          error: (String? message) {
            if (!ref.mounted) return;
            setState((state) => state.copyWith(
              isLoading: false,
              error: message ?? L10nKeys.errorLoadingTransactions,
            ));
          },
        );
      })
    );
  }

  void _addTransaction(double amount, String category) {
    final transaction = Transaction(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      amount: amount,
      category: category,
      date: DateTime.now(),
    );

    // Optimistic Update
    final previousTransactions = state.transactions;
    final newTransactions = [transaction, ...previousTransactions];
    setState((state) => state.copyWith(transactions: newTransactions, error: null));

    bag.add(
      transactionRepository.addTransaction(transaction).listen((resource) {
        resource.when(
          loading: () {}, // Handled optimistically
          content: (_) {}, // Success
          error: (String? message) {
            if (!ref.mounted) return;
            // Rollback on error
            setState((state) => state.copyWith(
              transactions: previousTransactions,
              error: message ?? L10nKeys.failedToAdd,
            ));
          },
        );
      })
    );
  }

  void _deleteTransaction(String id) {
    // Optimistic Update
    final previousTransactions = state.transactions;
    final newTransactions = previousTransactions.where((t) => t.id != id).toList();
    setState((state) => state.copyWith(transactions: newTransactions, error: null));

    bag.add(
      transactionRepository.deleteTransaction(id).listen((resource) {
        resource.when(
          loading: () {}, // Handled optimistically
          content: (_) {}, // Success
          error: (String? message) {
            if (!ref.mounted) return;
            // Rollback on error
            setState((state) => state.copyWith(
              transactions: previousTransactions,
              error: message ?? L10nKeys.failedToDelete,
            ));
          },
        );
      })
    );
  }

  void _clearAll() {
    final previousTransactions = state.transactions;
    setState((state) => state.copyWith(transactions: [], error: null));

    bag.add(
      transactionRepository.clearAll().listen((resource) {
        resource.when(
          loading: () {},
          content: (_) {},
          error: (String? message) {
            if (!ref.mounted) return;
            setState((state) => state.copyWith(
              transactions: previousTransactions,
              error: message ?? L10nKeys.failedToClear,
            ));
          },
        );
      }),
    );
  }
}
