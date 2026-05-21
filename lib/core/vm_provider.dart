import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../di/injection.dart';
import '../features/transactions/transaction_state.dart';
import '../features/transactions/transaction_view_model.dart';
import '../features/stats/stats_state.dart';
import '../features/stats/stats_view_model.dart';

class VmProvider {
  static final transactionVMP = NotifierProvider.autoDispose<TransactionViewModel, TransactionState>(() {
    return getIt.get<TransactionViewModel>();
  });

  static final statsVMP = NotifierProvider.autoDispose<StatsViewModel, StatsState>(() {
    return getIt.get<StatsViewModel>();
  });
}
