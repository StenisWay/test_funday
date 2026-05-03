// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AudioListState {

 AudioListStatus get status; List<AudioModel> get items; Map<int, DownloadStatus> get downloadStatuses; bool get hasMore; int get currentPage; int get total; String? get errorMessage;
/// Create a copy of AudioListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioListStateCopyWith<AudioListState> get copyWith => _$AudioListStateCopyWithImpl<AudioListState>(this as AudioListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioListState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.downloadStatuses, downloadStatuses)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.total, total) || other.total == total)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(downloadStatuses),hasMore,currentPage,total,errorMessage);

@override
String toString() {
  return 'AudioListState(status: $status, items: $items, downloadStatuses: $downloadStatuses, hasMore: $hasMore, currentPage: $currentPage, total: $total, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $AudioListStateCopyWith<$Res>  {
  factory $AudioListStateCopyWith(AudioListState value, $Res Function(AudioListState) _then) = _$AudioListStateCopyWithImpl;
@useResult
$Res call({
 AudioListStatus status, List<AudioModel> items, Map<int, DownloadStatus> downloadStatuses, bool hasMore, int currentPage, int total, String? errorMessage
});




}
/// @nodoc
class _$AudioListStateCopyWithImpl<$Res>
    implements $AudioListStateCopyWith<$Res> {
  _$AudioListStateCopyWithImpl(this._self, this._then);

  final AudioListState _self;
  final $Res Function(AudioListState) _then;

/// Create a copy of AudioListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? items = null,Object? downloadStatuses = null,Object? hasMore = null,Object? currentPage = null,Object? total = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AudioListStatus,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<AudioModel>,downloadStatuses: null == downloadStatuses ? _self.downloadStatuses : downloadStatuses // ignore: cast_nullable_to_non_nullable
as Map<int, DownloadStatus>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AudioListState].
extension AudioListStatePatterns on AudioListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AudioListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AudioListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AudioListState value)  $default,){
final _that = this;
switch (_that) {
case _AudioListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AudioListState value)?  $default,){
final _that = this;
switch (_that) {
case _AudioListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AudioListStatus status,  List<AudioModel> items,  Map<int, DownloadStatus> downloadStatuses,  bool hasMore,  int currentPage,  int total,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AudioListState() when $default != null:
return $default(_that.status,_that.items,_that.downloadStatuses,_that.hasMore,_that.currentPage,_that.total,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AudioListStatus status,  List<AudioModel> items,  Map<int, DownloadStatus> downloadStatuses,  bool hasMore,  int currentPage,  int total,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _AudioListState():
return $default(_that.status,_that.items,_that.downloadStatuses,_that.hasMore,_that.currentPage,_that.total,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AudioListStatus status,  List<AudioModel> items,  Map<int, DownloadStatus> downloadStatuses,  bool hasMore,  int currentPage,  int total,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _AudioListState() when $default != null:
return $default(_that.status,_that.items,_that.downloadStatuses,_that.hasMore,_that.currentPage,_that.total,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _AudioListState extends AudioListState {
  const _AudioListState({this.status = AudioListStatus.initial, final  List<AudioModel> items = const <AudioModel>[], final  Map<int, DownloadStatus> downloadStatuses = const <int, DownloadStatus>{}, this.hasMore = true, this.currentPage = 1, this.total = 0, this.errorMessage}): _items = items,_downloadStatuses = downloadStatuses,super._();
  

@override@JsonKey() final  AudioListStatus status;
 final  List<AudioModel> _items;
@override@JsonKey() List<AudioModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  Map<int, DownloadStatus> _downloadStatuses;
@override@JsonKey() Map<int, DownloadStatus> get downloadStatuses {
  if (_downloadStatuses is EqualUnmodifiableMapView) return _downloadStatuses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_downloadStatuses);
}

@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int total;
@override final  String? errorMessage;

/// Create a copy of AudioListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioListStateCopyWith<_AudioListState> get copyWith => __$AudioListStateCopyWithImpl<_AudioListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioListState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._downloadStatuses, _downloadStatuses)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.total, total) || other.total == total)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_downloadStatuses),hasMore,currentPage,total,errorMessage);

@override
String toString() {
  return 'AudioListState(status: $status, items: $items, downloadStatuses: $downloadStatuses, hasMore: $hasMore, currentPage: $currentPage, total: $total, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$AudioListStateCopyWith<$Res> implements $AudioListStateCopyWith<$Res> {
  factory _$AudioListStateCopyWith(_AudioListState value, $Res Function(_AudioListState) _then) = __$AudioListStateCopyWithImpl;
@override @useResult
$Res call({
 AudioListStatus status, List<AudioModel> items, Map<int, DownloadStatus> downloadStatuses, bool hasMore, int currentPage, int total, String? errorMessage
});




}
/// @nodoc
class __$AudioListStateCopyWithImpl<$Res>
    implements _$AudioListStateCopyWith<$Res> {
  __$AudioListStateCopyWithImpl(this._self, this._then);

  final _AudioListState _self;
  final $Res Function(_AudioListState) _then;

/// Create a copy of AudioListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? items = null,Object? downloadStatuses = null,Object? hasMore = null,Object? currentPage = null,Object? total = null,Object? errorMessage = freezed,}) {
  return _then(_AudioListState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AudioListStatus,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<AudioModel>,downloadStatuses: null == downloadStatuses ? _self._downloadStatuses : downloadStatuses // ignore: cast_nullable_to_non_nullable
as Map<int, DownloadStatus>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
