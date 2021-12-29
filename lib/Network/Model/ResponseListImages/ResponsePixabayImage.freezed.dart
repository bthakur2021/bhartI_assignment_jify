// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ResponsePixabayImage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResponsePixabayImage _$ResponsePixabayImageFromJson(Map<String, dynamic> json) {
  return _ResponsePixabayImage.fromJson(json);
}

/// @nodoc
class _$ResponsePixabayImageTearOff {
  const _$ResponsePixabayImageTearOff();

  _ResponsePixabayImage call(
      {int? totalHits,
      int? total,
      @ResponsePixabayImageListConverter()
          List<ResponsePixabayImageList>? hits}) {
    return _ResponsePixabayImage(
      totalHits: totalHits,
      total: total,
      hits: hits,
    );
  }

  ResponsePixabayImage fromJson(Map<String, Object> json) {
    return ResponsePixabayImage.fromJson(json);
  }
}

/// @nodoc
const $ResponsePixabayImage = _$ResponsePixabayImageTearOff();

/// @nodoc
mixin _$ResponsePixabayImage {
  int? get totalHits => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;
  @ResponsePixabayImageListConverter()
  List<ResponsePixabayImageList>? get hits =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponsePixabayImageCopyWith<ResponsePixabayImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponsePixabayImageCopyWith<$Res> {
  factory $ResponsePixabayImageCopyWith(ResponsePixabayImage value,
          $Res Function(ResponsePixabayImage) then) =
      _$ResponsePixabayImageCopyWithImpl<$Res>;
  $Res call(
      {int? totalHits,
      int? total,
      @ResponsePixabayImageListConverter()
          List<ResponsePixabayImageList>? hits});
}

/// @nodoc
class _$ResponsePixabayImageCopyWithImpl<$Res>
    implements $ResponsePixabayImageCopyWith<$Res> {
  _$ResponsePixabayImageCopyWithImpl(this._value, this._then);

  final ResponsePixabayImage _value;
  // ignore: unused_field
  final $Res Function(ResponsePixabayImage) _then;

  @override
  $Res call({
    Object? totalHits = freezed,
    Object? total = freezed,
    Object? hits = freezed,
  }) {
    return _then(_value.copyWith(
      totalHits: totalHits == freezed
          ? _value.totalHits
          : totalHits // ignore: cast_nullable_to_non_nullable
              as int?,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      hits: hits == freezed
          ? _value.hits
          : hits // ignore: cast_nullable_to_non_nullable
              as List<ResponsePixabayImageList>?,
    ));
  }
}

/// @nodoc
abstract class _$ResponsePixabayImageCopyWith<$Res>
    implements $ResponsePixabayImageCopyWith<$Res> {
  factory _$ResponsePixabayImageCopyWith(_ResponsePixabayImage value,
          $Res Function(_ResponsePixabayImage) then) =
      __$ResponsePixabayImageCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? totalHits,
      int? total,
      @ResponsePixabayImageListConverter()
          List<ResponsePixabayImageList>? hits});
}

/// @nodoc
class __$ResponsePixabayImageCopyWithImpl<$Res>
    extends _$ResponsePixabayImageCopyWithImpl<$Res>
    implements _$ResponsePixabayImageCopyWith<$Res> {
  __$ResponsePixabayImageCopyWithImpl(
      _ResponsePixabayImage _value, $Res Function(_ResponsePixabayImage) _then)
      : super(_value, (v) => _then(v as _ResponsePixabayImage));

  @override
  _ResponsePixabayImage get _value => super._value as _ResponsePixabayImage;

  @override
  $Res call({
    Object? totalHits = freezed,
    Object? total = freezed,
    Object? hits = freezed,
  }) {
    return _then(_ResponsePixabayImage(
      totalHits: totalHits == freezed
          ? _value.totalHits
          : totalHits // ignore: cast_nullable_to_non_nullable
              as int?,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      hits: hits == freezed
          ? _value.hits
          : hits // ignore: cast_nullable_to_non_nullable
              as List<ResponsePixabayImageList>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResponsePixabayImage extends _ResponsePixabayImage {
  const _$_ResponsePixabayImage(
      {this.totalHits,
      this.total,
      @ResponsePixabayImageListConverter() this.hits})
      : super._();

  factory _$_ResponsePixabayImage.fromJson(Map<String, dynamic> json) =>
      _$$_ResponsePixabayImageFromJson(json);

  @override
  final int? totalHits;
  @override
  final int? total;
  @override
  @ResponsePixabayImageListConverter()
  final List<ResponsePixabayImageList>? hits;

  @override
  String toString() {
    return 'ResponsePixabayImage(totalHits: $totalHits, total: $total, hits: $hits)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ResponsePixabayImage &&
            (identical(other.totalHits, totalHits) ||
                const DeepCollectionEquality()
                    .equals(other.totalHits, totalHits)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)) &&
            (identical(other.hits, hits) ||
                const DeepCollectionEquality().equals(other.hits, hits)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(totalHits) ^
      const DeepCollectionEquality().hash(total) ^
      const DeepCollectionEquality().hash(hits);

  @JsonKey(ignore: true)
  @override
  _$ResponsePixabayImageCopyWith<_ResponsePixabayImage> get copyWith =>
      __$ResponsePixabayImageCopyWithImpl<_ResponsePixabayImage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResponsePixabayImageToJson(this);
  }
}

abstract class _ResponsePixabayImage extends ResponsePixabayImage {
  const factory _ResponsePixabayImage(
      {int? totalHits,
      int? total,
      @ResponsePixabayImageListConverter()
          List<ResponsePixabayImageList>? hits}) = _$_ResponsePixabayImage;
  const _ResponsePixabayImage._() : super._();

  factory _ResponsePixabayImage.fromJson(Map<String, dynamic> json) =
      _$_ResponsePixabayImage.fromJson;

  @override
  int? get totalHits => throw _privateConstructorUsedError;
  @override
  int? get total => throw _privateConstructorUsedError;
  @override
  @ResponsePixabayImageListConverter()
  List<ResponsePixabayImageList>? get hits =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ResponsePixabayImageCopyWith<_ResponsePixabayImage> get copyWith =>
      throw _privateConstructorUsedError;
}
