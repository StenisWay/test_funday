// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AudioResponseDto {

 int get total; List<AudioItemDto> get data;
/// Create a copy of AudioResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioResponseDtoCopyWith<AudioResponseDto> get copyWith => _$AudioResponseDtoCopyWithImpl<AudioResponseDto>(this as AudioResponseDto, _$identity);

  /// Serializes this AudioResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioResponseDto&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'AudioResponseDto(total: $total, data: $data)';
}


}

/// @nodoc
abstract mixin class $AudioResponseDtoCopyWith<$Res>  {
  factory $AudioResponseDtoCopyWith(AudioResponseDto value, $Res Function(AudioResponseDto) _then) = _$AudioResponseDtoCopyWithImpl;
@useResult
$Res call({
 int total, List<AudioItemDto> data
});




}
/// @nodoc
class _$AudioResponseDtoCopyWithImpl<$Res>
    implements $AudioResponseDtoCopyWith<$Res> {
  _$AudioResponseDtoCopyWithImpl(this._self, this._then);

  final AudioResponseDto _self;
  final $Res Function(AudioResponseDto) _then;

/// Create a copy of AudioResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? data = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<AudioItemDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [AudioResponseDto].
extension AudioResponseDtoPatterns on AudioResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AudioResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AudioResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AudioResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _AudioResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AudioResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _AudioResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  List<AudioItemDto> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AudioResponseDto() when $default != null:
return $default(_that.total,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  List<AudioItemDto> data)  $default,) {final _that = this;
switch (_that) {
case _AudioResponseDto():
return $default(_that.total,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  List<AudioItemDto> data)?  $default,) {final _that = this;
switch (_that) {
case _AudioResponseDto() when $default != null:
return $default(_that.total,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AudioResponseDto implements AudioResponseDto {
  const _AudioResponseDto({this.total = 0, final  List<AudioItemDto> data = const <AudioItemDto>[]}): _data = data;
  factory _AudioResponseDto.fromJson(Map<String, dynamic> json) => _$AudioResponseDtoFromJson(json);

@override@JsonKey() final  int total;
 final  List<AudioItemDto> _data;
@override@JsonKey() List<AudioItemDto> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of AudioResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioResponseDtoCopyWith<_AudioResponseDto> get copyWith => __$AudioResponseDtoCopyWithImpl<_AudioResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AudioResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioResponseDto&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'AudioResponseDto(total: $total, data: $data)';
}


}

/// @nodoc
abstract mixin class _$AudioResponseDtoCopyWith<$Res> implements $AudioResponseDtoCopyWith<$Res> {
  factory _$AudioResponseDtoCopyWith(_AudioResponseDto value, $Res Function(_AudioResponseDto) _then) = __$AudioResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 int total, List<AudioItemDto> data
});




}
/// @nodoc
class __$AudioResponseDtoCopyWithImpl<$Res>
    implements _$AudioResponseDtoCopyWith<$Res> {
  __$AudioResponseDtoCopyWithImpl(this._self, this._then);

  final _AudioResponseDto _self;
  final $Res Function(_AudioResponseDto) _then;

/// Create a copy of AudioResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? data = null,}) {
  return _then(_AudioResponseDto(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<AudioItemDto>,
  ));
}


}

// dart format on
