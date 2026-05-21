import 'package:injectable/injectable.dart';
import '../../core/base_view_model.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../utilities/resource.dart';
import 'stats_state.dart';
import 'transaction_stats.dart';

@injectable
class StatsViewModel extends BaseViewModel<StatsState> {
  final TransactionRepository _repository;

  StatsViewModel(this._repository) : super();

  @override
  StatsState build() {
    ref.onDispose(() {
      dispose();
    });
    
    _listenToTransactions();
    return const StatsState();
  }

  void _listenToTransactions() {
    bag.add(
      _repository.getTransactions().listen((resource) {
        resource.whenOrNull(
          content: (transactions) {
            if (!ref.mounted) return;
            
            setState((state) => state.copyWith(
              totalSpent: TransactionStats.totalSpent(transactions),
              transactionCount: transactions.length,
              last7DaysSpending: TransactionStats.last7Amounts(transactions),
            ));
          },
        );
      })
    );
  }
}
