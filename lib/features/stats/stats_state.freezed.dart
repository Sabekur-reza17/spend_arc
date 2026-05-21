// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StatsState {

 double get totalSpent; int get transactionCount; List<double> get last7DaysSpending;
/// Create a copy of StatsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatsStateCopyWith<StatsState> get copyWith => _$StatsStateCopyWithImpl<StatsState>(this as StatsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatsState&&(identical(other.totalSpent, totalSpent) || other.totalSpent == totalSpent)&&(identical(other.transactionCount, transactionCount) || other.transactionCount == transactionCount)&&const DeepCollectionEquality().equals(other.last7DaysSpending, last7DaysSpending));
}


@override
int get hashCode => Object.hash(runtimeType,totalSpent,transactionCount,const DeepCollectionEquality().hash(last7DaysSpending));

@override
String toString() {
  return 'StatsState(totalSpent: $totalSpent, transactionCount: $transactionCount, last7DaysSpending: $last7DaysSpending)';
}


}

/// @nodoc
abstract mixin class $StatsStateCopyWith<$Res>  {
  factory $StatsStateCopyWith(StatsState value, $Res Function(StatsState) _then) = _$StatsStateCopyWithImpl;
@useResult
$Res call({
 double totalSpent, int transactionCount, List<double> last7DaysSpending
});




}
/// @nodoc
class _$StatsStateCopyWithImpl<$Res>
    implements $StatsStateCopyWith<$Res> {
  _$StatsStateCopyWithImpl(this._self, this._then);

  final StatsState _self;
  final $Res Function(StatsState) _then;

/// Create a copy of StatsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalSpent = null,Object? transactionCount = null,Object? last7DaysSpending = null,}) {
  return _then(_self.copyWith(
totalSpent: null == totalSpent ? _self.totalSpent : totalSpent // ignore: cast_nullable_to_non_nullable
as double,transactionCount: null == transactionCount ? _self.transactionCount : transactionCount // ignore: cast_nullable_to_non_nullable
as int,last7DaysSpending: null == last7DaysSpending ? _self.last7DaysSpending : last7DaysSpending // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}

}


/// Adds pattern-matching-related methods to [StatsState].
extension StatsStatePatterns on StatsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatsState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatsState value)  $default,){
final _that = this;
switch (_that) {
case _StatsState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatsState value)?  $default,){
final _that = this;
switch (_that) {
case _StatsState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double totalSpent,  int transactionCount,  List<double> last7DaysSpending)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatsState() when $default != null:
return $default(_that.totalSpent,_that.transactionCount,_that.last7DaysSpending);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double totalSpent,  int transactionCount,  List<double> last7DaysSpending)  $default,) {final _that = this;
switch (_that) {
case _StatsState():
return $default(_that.totalSpent,_that.transactionCount,_that.last7DaysSpending);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double totalSpent,  int transactionCount,  List<double> last7DaysSpending)?  $default,) {final _that = this;
switch (_that) {
case _StatsState() when $default != null:
return $default(_that.totalSpent,_that.transactionCount,_that.last7DaysSpending);case _:
  return null;

}
}

}

/// @nodoc


class _StatsState implements StatsState {
  const _StatsState({this.totalSpent = 0.0, this.transactionCount = 0, final  List<double> last7DaysSpending = const []}): _last7DaysSpending = last7DaysSpending;
  

@override@JsonKey() final  double totalSpent;
@override@JsonKey() final  int transactionCount;
 final  List<double> _last7DaysSpending;
@override@JsonKey() List<double> get last7DaysSpending {
  if (_last7DaysSpending is EqualUnmodifiableListView) return _last7DaysSpending;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_last7DaysSpending);
}


/// Create a copy of StatsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatsStateCopyWith<_StatsState> get copyWith => __$StatsStateCopyWithImpl<_StatsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatsState&&(identical(other.totalSpent, totalSpent) || other.totalSpent == totalSpent)&&(identical(other.transactionCount, transactionCount) || other.transactionCount == transactionCount)&&const DeepCollectionEquality().equals(other._last7DaysSpending, _last7DaysSpending));
}


@override
int get hashCode => Object.hash(runtimeType,totalSpent,transactionCount,const DeepCollectionEquality().hash(_last7DaysSpending));

@override
String toString() {
  return 'StatsState(totalSpent: $totalSpent, transactionCount: $transactionCount, last7DaysSpending: $last7DaysSpending)';
}


}

/// @nodoc
abstract mixin class _$StatsStateCopyWith<$Res> implements $StatsStateCopyWith<$Res> {
  factory _$StatsStateCopyWith(_StatsState value, $Res Function(_StatsState) _then) = __$StatsStateCopyWithImpl;
@override @useResult
$Res call({
 double totalSpent, int transactionCount, List<double> last7DaysSpending
});




}
/// @nodoc
class __$StatsStateCopyWithImpl<$Res>
    implements _$StatsStateCopyWith<$Res> {
  __$StatsStateCopyWithImpl(this._self, this._then);

  final _StatsState _self;
  final $Res Function(_StatsState) _then;

/// Create a copy of StatsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalSpent = null,Object? transactionCount = null,Object? last7DaysSpending = null,}) {
  return _then(_StatsState(
totalSpent: null == totalSpent ? _self.totalSpent : totalSpent // ignore: cast_nullable_to_non_nullable
as double,transactionCount: null == transactionCount ? _self.transactionCount : transactionCount // ignore: cast_nullable_to_non_nullable
as int,last7DaysSpending: null == last7DaysSpending ? _self._last7DaysSpending : last7DaysSpending // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}


}

// dart format on
