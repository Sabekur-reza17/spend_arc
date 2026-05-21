import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

@DataClassName('TransactionEntity')
class TransactionsTable extends Table {
  TextColumn get id => text()();
  RealColumn get amount => real()();
  TextColumn get category => text()();
  IntColumn get dateMillis => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [TransactionsTable], daos: [TransactionDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'spendarc_db'));

  @override
  int get schemaVersion => 1;
}

@DriftAccessor(tables: [TransactionsTable])
class TransactionDao extends DatabaseAccessor<AppDatabase> with _$TransactionDaoMixin {
  TransactionDao(AppDatabase db) : super(db);

  Future<List<TransactionEntity>> getTransactions() => (select(transactionsTable)
        ..orderBy([(t) => OrderingTerm.desc(t.dateMillis)]))
      .get();

  Future<void> clearAll() => delete(transactionsTable).go();
  
  Future<void> insertTransaction(TransactionEntity transaction) => 
      into(transactionsTable).insert(transaction, mode: InsertMode.replace);
      
  Future<void> deleteTransactionById(String id) => 
      (delete(transactionsTable)..where((t) => t.id.equals(id))).go();
}
