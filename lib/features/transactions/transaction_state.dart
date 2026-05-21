import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/models/transaction.dart';

part 'transaction_state.freezed.dart';

@Freezed()
abstract class TransactionState with _$TransactionState {
  factory TransactionState({
    @Default(false) bool isLoading,
    @Default([]) List<Transaction> transactions,
    @Default(null) String? error,
  }) = _TransactionState;
}
