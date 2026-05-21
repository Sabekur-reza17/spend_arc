import '../../utilities/resource.dart';
import '../models/transaction.dart';

abstract class TransactionRepository {
  Stream<Resource<List<Transaction>>> getTransactions();
  Stream<Resource<void>> addTransaction(Transaction transaction);
  Stream<Resource<void>> deleteTransaction(String id);
  Stream<Resource<void>> clearAll();
}
