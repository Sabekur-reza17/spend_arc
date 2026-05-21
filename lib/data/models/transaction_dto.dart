import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/models/transaction.dart';
import '../../l10n/l10n_keys.dart';

part 'transaction_dto.freezed.dart';
part 'transaction_dto.g.dart';

@freezed
abstract class TransactionDto with _$TransactionDto {
  const factory TransactionDto({
    String? id,
    double? amount,
    String? category,
    DateTime? date,
  }) = _TransactionDto;

  factory TransactionDto.fromJson(Map<String, dynamic> json) => _$TransactionDtoFromJson(json);

  const TransactionDto._();

  Transaction toDomain() {
    return Transaction(
      id: id ?? '',
      amount: amount ?? 0.0,
      category: category ?? L10nKeys.unknownCategory,
      date: date ?? DateTime.now(),
    );
  }

  factory TransactionDto.fromDomain(Transaction transaction) {
    return TransactionDto(
      id: transaction.id,
      amount: transaction.amount,
      category: transaction.category,
      date: transaction.date,
    );
  }
}
