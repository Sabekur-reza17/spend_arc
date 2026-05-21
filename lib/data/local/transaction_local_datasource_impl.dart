import 'transaction_local_datasource.dart';
import '../../l10n/l10n_keys.dart';
import '../models/transaction_dto.dart';
import 'app_database.dart';

class TransactionLocalDataSourceImpl implements TransactionLocalDataSource {
  final TransactionDao _transactionDao;

  TransactionLocalDataSourceImpl(this._transactionDao);

  @override
  Future<List<TransactionDto>> getTransactions() async {
    final entities = await _transactionDao.getTransactions();
    return entities.map((e) => TransactionDto(
      id: e.id,
      amount: e.amount,
      category: e.category,
      date: DateTime.fromMillisecondsSinceEpoch(e.dateMillis),
    )).toList();
  }

  @override
  Future<void> addTransaction(TransactionDto transaction) async {
    final entity = TransactionEntity(
      id: transaction.id ?? '',
      amount: transaction.amount ?? 0.0,
      category: transaction.category ?? L10nKeys.unknownCategory,
      dateMillis: transaction.date?.millisecondsSinceEpoch ?? 0,
    );
    await _transactionDao.insertTransaction(entity);
  }

  @override
  Future<void> deleteTransaction(String id) async {
    await _transactionDao.deleteTransactionById(id);
  }

  @override
  Future<void> clearAll() async {
    await _transactionDao.clearAll();
  }
}