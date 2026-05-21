import 'package:injectable/injectable.dart';

import '../data/local/transaction_local_datasource.dart';
import '../data/local/transaction_local_datasource_impl.dart';
import '../data/repositories/transaction_repository_impl.dart';
import '../domain/repositories/transaction_repository.dart';
import '../data/local/app_database.dart';

@module
abstract class AppModule {
  @singleton
  TransactionDao provideTransactionDao(AppDatabase database) {
    return database.transactionDao;
  }

  @singleton
  TransactionLocalDataSource provideTransactionLocalDataSource(TransactionDao dao) {
    return TransactionLocalDataSourceImpl(dao);
  }

  @singleton
  TransactionRepository provideTransactionRepository(TransactionLocalDataSource localDataSource) {
    return TransactionRepositoryImpl(localDataSource);
  }
}
