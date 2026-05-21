import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource.freezed.dart';

@freezed
class Resource<T> with _$Resource<T> {
  const factory Resource.loading() = Loading;
  const factory Resource.content(T content) = Content;
  const factory Resource.error(String message) = Error;
}