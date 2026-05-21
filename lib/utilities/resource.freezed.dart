// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resource.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Resource<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Resource<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Resource<$T>()';
}


}

/// @nodoc
class $ResourceCopyWith<T,$Res>  {
$ResourceCopyWith(Resource<T> _, $Res Function(Resource<T>) __);
}


/// Adds pattern-matching-related methods to [Resource].
extension ResourcePatterns<T> on Resource<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Loading<T> value)?  loading,TResult Function( Content<T> value)?  content,TResult Function( Error<T> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Loading() when loading != null:
return loading(_that);case Content() when content != null:
return content(_that);case Error() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Loading<T> value)  loading,required TResult Function( Content<T> value)  content,required TResult Function( Error<T> value)  error,}){
final _that = this;
switch (_that) {
case Loading():
return loading(_that);case Content():
return content(_that);case Error():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Loading<T> value)?  loading,TResult? Function( Content<T> value)?  content,TResult? Function( Error<T> value)?  error,}){
final _that = this;
switch (_that) {
case Loading() when loading != null:
return loading(_that);case Content() when content != null:
return content(_that);case Error() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( T content)?  content,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Loading() when loading != null:
return loading();case Content() when content != null:
return content(_that.content);case Error() when error != null:
return error(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( T content)  content,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case Loading():
return loading();case Content():
return content(_that.content);case Error():
return error(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( T content)?  content,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case Loading() when loading != null:
return loading();case Content() when content != null:
return content(_that.content);case Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Loading<T> implements Resource<T> {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Resource<$T>.loading()';
}


}




/// @nodoc


class Content<T> implements Resource<T> {
  const Content(this.content);
  

 final  T content;

/// Create a copy of Resource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContentCopyWith<T, Content<T>> get copyWith => _$ContentCopyWithImpl<T, Content<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Content<T>&&const DeepCollectionEquality().equals(other.content, content));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(content));

@override
String toString() {
  return 'Resource<$T>.content(content: $content)';
}


}

/// @nodoc
abstract mixin class $ContentCopyWith<T,$Res> implements $ResourceCopyWith<T, $Res> {
  factory $ContentCopyWith(Content<T> value, $Res Function(Content<T>) _then) = _$ContentCopyWithImpl;
@useResult
$Res call({
 T content
});




}
/// @nodoc
class _$ContentCopyWithImpl<T,$Res>
    implements $ContentCopyWith<T, $Res> {
  _$ContentCopyWithImpl(this._self, this._then);

  final Content<T> _self;
  final $Res Function(Content<T>) _then;

/// Create a copy of Resource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? content = freezed,}) {
  return _then(Content<T>(
freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class Error<T> implements Resource<T> {
  const Error(this.message);
  

 final  String message;

/// Create a copy of Resource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<T, Error<T>> get copyWith => _$ErrorCopyWithImpl<T, Error<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Resource<$T>.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<T,$Res> implements $ResourceCopyWith<T, $Res> {
  factory $ErrorCopyWith(Error<T> value, $Res Function(Error<T>) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<T,$Res>
    implements $ErrorCopyWith<T, $Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error<T> _self;
  final $Res Function(Error<T>) _then;

/// Create a copy of Resource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error<T>(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
