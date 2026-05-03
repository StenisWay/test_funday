// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AudioItemDto {

 int get id; String get title; String get url; String? get modified;
/// Create a copy of AudioItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioItemDtoCopyWith<AudioItemDto> get copyWith => _$AudioItemDtoCopyWithImpl<AudioItemDto>(this as AudioItemDto, _$identity);

  /// Serializes this AudioItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.modified, modified) || other.modified == modified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,url,modified);

@override
String toString() {
  return 'AudioItemDto(id: $id, title: $title, url: $url, modified: $modified)';
}


}

/// @nodoc
abstract mixin class $AudioItemDtoCopyWith<$Res>  {
  factory $AudioItemDtoCopyWith(AudioItemDto value, $Res Function(AudioItemDto) _then) = _$AudioItemDtoCopyWithImpl;
@useResult
$Res call({
 int id, String title, String url, String? modified
});




}
/// @nodoc
class _$AudioItemDtoCopyWithImpl<$Res>
    implements $AudioItemDtoCopyWith<$Res> {
  _$AudioItemDtoCopyWithImpl(this._self, this._then);

  final AudioItemDto _self;
  final $Res Function(AudioItemDto) _then;

/// Create a copy of AudioItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? url = null,Object? modified = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,modified: freezed == modified ? _self.modified : modified // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AudioItemDto].
extension AudioItemDtoPatterns on AudioItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AudioItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AudioItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AudioItemDto value)  $default,){
final _that = this;
switch (_that) {
case _AudioItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AudioItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _AudioItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String url,  String? modified)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AudioItemDto() when $default != null:
return $default(_that.id,_that.title,_that.url,_that.modified);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String url,  String? modified)  $default,) {final _that = this;
switch (_that) {
case _AudioItemDto():
return $default(_that.id,_that.title,_that.url,_that.modified);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String url,  String? modified)?  $default,) {final _that = this;
switch (_that) {
case _AudioItemDto() when $default != null:
return $default(_that.id,_that.title,_that.url,_that.modified);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AudioItemDto implements AudioItemDto {
  const _AudioItemDto({this.id = 0, this.title = '', this.url = '', this.modified});
  factory _AudioItemDto.fromJson(Map<String, dynamic> json) => _$AudioItemDtoFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  String title;
@override@JsonKey() final  String url;
@override final  String? modified;

/// Create a copy of AudioItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioItemDtoCopyWith<_AudioItemDto> get copyWith => __$AudioItemDtoCopyWithImpl<_AudioItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AudioItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.modified, modified) || other.modified == modified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,url,modified);

@override
String toString() {
  return 'AudioItemDto(id: $id, title: $title, url: $url, modified: $modified)';
}


}

/// @nodoc
abstract mixin class _$AudioItemDtoCopyWith<$Res> implements $AudioItemDtoCopyWith<$Res> {
  factory _$AudioItemDtoCopyWith(_AudioItemDto value, $Res Function(_AudioItemDto) _then) = __$AudioItemDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String url, String? modified
});




}
/// @nodoc
class __$AudioItemDtoCopyWithImpl<$Res>
    implements _$AudioItemDtoCopyWith<$Res> {
  __$AudioItemDtoCopyWithImpl(this._self, this._then);

  final _AudioItemDto _self;
  final $Res Function(_AudioItemDto) _then;

/// Create a copy of AudioItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? url = null,Object? modified = freezed,}) {
  return _then(_AudioItemDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,modified: freezed == modified ? _self.modified : modified // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
