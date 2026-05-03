// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AudioModel {

 int get id; String get title; String get url;/// API 回傳的 modified 時間戳（ISO 8601），可為 null
 String? get modified;
/// Create a copy of AudioModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioModelCopyWith<AudioModel> get copyWith => _$AudioModelCopyWithImpl<AudioModel>(this as AudioModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.modified, modified) || other.modified == modified));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,url,modified);

@override
String toString() {
  return 'AudioModel(id: $id, title: $title, url: $url, modified: $modified)';
}


}

/// @nodoc
abstract mixin class $AudioModelCopyWith<$Res>  {
  factory $AudioModelCopyWith(AudioModel value, $Res Function(AudioModel) _then) = _$AudioModelCopyWithImpl;
@useResult
$Res call({
 int id, String title, String url, String? modified
});




}
/// @nodoc
class _$AudioModelCopyWithImpl<$Res>
    implements $AudioModelCopyWith<$Res> {
  _$AudioModelCopyWithImpl(this._self, this._then);

  final AudioModel _self;
  final $Res Function(AudioModel) _then;

/// Create a copy of AudioModel
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


/// Adds pattern-matching-related methods to [AudioModel].
extension AudioModelPatterns on AudioModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AudioModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AudioModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AudioModel value)  $default,){
final _that = this;
switch (_that) {
case _AudioModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AudioModel value)?  $default,){
final _that = this;
switch (_that) {
case _AudioModel() when $default != null:
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
case _AudioModel() when $default != null:
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
case _AudioModel():
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
case _AudioModel() when $default != null:
return $default(_that.id,_that.title,_that.url,_that.modified);case _:
  return null;

}
}

}

/// @nodoc


class _AudioModel extends AudioModel {
  const _AudioModel({required this.id, this.title = '', this.url = '', this.modified}): super._();
  

@override final  int id;
@override@JsonKey() final  String title;
@override@JsonKey() final  String url;
/// API 回傳的 modified 時間戳（ISO 8601），可為 null
@override final  String? modified;

/// Create a copy of AudioModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioModelCopyWith<_AudioModel> get copyWith => __$AudioModelCopyWithImpl<_AudioModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.modified, modified) || other.modified == modified));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,url,modified);

@override
String toString() {
  return 'AudioModel(id: $id, title: $title, url: $url, modified: $modified)';
}


}

/// @nodoc
abstract mixin class _$AudioModelCopyWith<$Res> implements $AudioModelCopyWith<$Res> {
  factory _$AudioModelCopyWith(_AudioModel value, $Res Function(_AudioModel) _then) = __$AudioModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String url, String? modified
});




}
/// @nodoc
class __$AudioModelCopyWithImpl<$Res>
    implements _$AudioModelCopyWith<$Res> {
  __$AudioModelCopyWithImpl(this._self, this._then);

  final _AudioModel _self;
  final $Res Function(_AudioModel) _then;

/// Create a copy of AudioModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? url = null,Object? modified = freezed,}) {
  return _then(_AudioModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,modified: freezed == modified ? _self.modified : modified // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
