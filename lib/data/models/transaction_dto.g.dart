// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionDto _$TransactionDtoFromJson(Map<String, dynamic> json) =>
    _TransactionDto(
      id: json['id'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      category: json['category'] as String?,
      date: json['date'] == null
          ? null
          : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$TransactionDtoToJson(_TransactionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'category': instance.category,
      'date': instance.date?.toIso8601String(),
    };
