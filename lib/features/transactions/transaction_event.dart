sealed class TransactionEvent {}

class OnLoadTransactions extends TransactionEvent {}

class OnAddTransaction extends TransactionEvent {
  final double amount;
  final String category;
  OnAddTransaction({required this.amount, required this.category});
}

class OnDeleteTransaction extends TransactionEvent {
  final String id;
  OnDeleteTransaction({required this.id});
}

class OnClearAllTransactions extends TransactionEvent {}
