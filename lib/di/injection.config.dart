// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:spend_arc/core/app_router.dart' as _i964;
import 'package:spend_arc/data/local/app_database.dart' as _i732;
import 'package:spend_arc/data/local/transaction_local_datasource.dart'
    as _i843;
import 'package:spend_arc/di/app_module.dart' as _i409;
import 'package:spend_arc/domain/repositories/transaction_repository.dart'
    as _i192;
import 'package:spend_arc/features/stats/stats_view_model.dart' as _i422;
import 'package:spend_arc/features/transactions/transaction_view_model.dart'
    as _i553;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.singleton<_i964.AppRouter>(() => _i964.AppRouter());
    gh.singleton<_i732.TransactionDao>(
      () => appModule.provideTransactionDao(gh<_i732.AppDatabase>()),
    );
    gh.singleton<_i843.TransactionLocalDataSource>(
      () => appModule.provideTransactionLocalDataSource(
        gh<_i732.TransactionDao>(),
      ),
    );
    gh.singleton<_i192.TransactionRepository>(
      () => appModule.provideTransactionRepository(
        gh<_i843.TransactionLocalDataSource>(),
      ),
    );
    gh.factory<_i422.StatsViewModel>(
      () => _i422.StatsViewModel(gh<_i192.TransactionRepository>()),
    );
    gh.factory<_i553.TransactionViewModel>(
      () => _i553.TransactionViewModel(gh<_i192.TransactionRepository>()),
    );
    return this;
  }
}

class _$AppModule extends _i409.AppModule {}
