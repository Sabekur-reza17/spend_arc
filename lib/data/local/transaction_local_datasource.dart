
import '../models/transaction_dto.dart';

abstract class TransactionLocalDataSource {
  Future<List<TransactionDto>> getTransactions();

  Future<void> addTransaction(TransactionDto transaction);

  Future<void> deleteTransaction(String id);

  Future<void> clearAll();
}


