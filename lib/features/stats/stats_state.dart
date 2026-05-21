import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_state.freezed.dart';

@freezed
abstract class StatsState with _$StatsState {
  const factory StatsState({
    @Default(0.0) double totalSpent,
    @Default(0) int transactionCount,
    @Default([]) List<double> last7DaysSpending,
  }) = _StatsState;
}
