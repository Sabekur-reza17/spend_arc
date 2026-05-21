import '../../domain/models/transaction.dart';

abstract final class TransactionStats {
  static double totalSpent(List<Transaction> transactions) {
    return transactions.fold(0.0, (sum, t) => sum + t.amount);
  }

  static List<double> last7Amounts(List<Transaction> transactions) {
    if (transactions.isEmpty) return const [];
    return transactions.take(7).map((t) => t.amount).toList();
  }
}
