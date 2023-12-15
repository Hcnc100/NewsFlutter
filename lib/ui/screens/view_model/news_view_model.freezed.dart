// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewsState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<NewsData>? get listNews => throw _privateConstructorUsedError;
  bool get isConcated => throw _privateConstructorUsedError;
  bool get enableLoadMore => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsStateCopyWith<NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) then) =
      _$NewsStateCopyWithImpl<$Res, NewsState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<NewsData>? listNews,
      bool isConcated,
      bool enableLoadMore,
      String message});
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res, $Val extends NewsState>
    implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? listNews = freezed,
    Object? isConcated = null,
    Object? enableLoadMore = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      listNews: freezed == listNews
          ? _value.listNews
          : listNews // ignore: cast_nullable_to_non_nullable
              as List<NewsData>?,
      isConcated: null == isConcated
          ? _value.isConcated
          : isConcated // ignore: cast_nullable_to_non_nullable
              as bool,
      enableLoadMore: null == enableLoadMore
          ? _value.enableLoadMore
          : enableLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsStateImplCopyWith<$Res>
    implements $NewsStateCopyWith<$Res> {
  factory _$$NewsStateImplCopyWith(
          _$NewsStateImpl value, $Res Function(_$NewsStateImpl) then) =
      __$$NewsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<NewsData>? listNews,
      bool isConcated,
      bool enableLoadMore,
      String message});
}

/// @nodoc
class __$$NewsStateImplCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$NewsStateImpl>
    implements _$$NewsStateImplCopyWith<$Res> {
  __$$NewsStateImplCopyWithImpl(
      _$NewsStateImpl _value, $Res Function(_$NewsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? listNews = freezed,
    Object? isConcated = null,
    Object? enableLoadMore = null,
    Object? message = null,
  }) {
    return _then(_$NewsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      listNews: freezed == listNews
          ? _value._listNews
          : listNews // ignore: cast_nullable_to_non_nullable
              as List<NewsData>?,
      isConcated: null == isConcated
          ? _value.isConcated
          : isConcated // ignore: cast_nullable_to_non_nullable
              as bool,
      enableLoadMore: null == enableLoadMore
          ? _value.enableLoadMore
          : enableLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NewsStateImpl implements _NewsState {
  const _$NewsStateImpl(
      {this.isLoading = true,
      final List<NewsData>? listNews = null,
      this.isConcated = false,
      this.enableLoadMore = false,
      this.message = ""})
      : _listNews = listNews;

  @override
  @JsonKey()
  final bool isLoading;
  final List<NewsData>? _listNews;
  @override
  @JsonKey()
  List<NewsData>? get listNews {
    final value = _listNews;
    if (value == null) return null;
    if (_listNews is EqualUnmodifiableListView) return _listNews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool isConcated;
  @override
  @JsonKey()
  final bool enableLoadMore;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'NewsState(isLoading: $isLoading, listNews: $listNews, isConcated: $isConcated, enableLoadMore: $enableLoadMore, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._listNews, _listNews) &&
            (identical(other.isConcated, isConcated) ||
                other.isConcated == isConcated) &&
            (identical(other.enableLoadMore, enableLoadMore) ||
                other.enableLoadMore == enableLoadMore) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_listNews),
      isConcated,
      enableLoadMore,
      message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsStateImplCopyWith<_$NewsStateImpl> get copyWith =>
      __$$NewsStateImplCopyWithImpl<_$NewsStateImpl>(this, _$identity);
}

abstract class _NewsState implements NewsState {
  const factory _NewsState(
      {final bool isLoading,
      final List<NewsData>? listNews,
      final bool isConcated,
      final bool enableLoadMore,
      final String message}) = _$NewsStateImpl;

  @override
  bool get isLoading;
  @override
  List<NewsData>? get listNews;
  @override
  bool get isConcated;
  @override
  bool get enableLoadMore;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$NewsStateImplCopyWith<_$NewsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
