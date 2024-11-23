// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../features/super_duper_algorithm/attribute_for_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttributeForApi _$AttributeForApiFromJson(Map<String, dynamic> json) {
  return _AttributeForApi.fromJson(json);
}

/// @nodoc
mixin _$AttributeForApi {
  Attribute get attribute => throw _privateConstructorUsedError;
  num? get minValue => throw _privateConstructorUsedError;
  num? get maxValue => throw _privateConstructorUsedError;

  /// Serializes this AttributeForApi to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttributeForApi
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttributeForApiCopyWith<AttributeForApi> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttributeForApiCopyWith<$Res> {
  factory $AttributeForApiCopyWith(
          AttributeForApi value, $Res Function(AttributeForApi) then) =
      _$AttributeForApiCopyWithImpl<$Res, AttributeForApi>;
  @useResult
  $Res call({Attribute attribute, num? minValue, num? maxValue});
}

/// @nodoc
class _$AttributeForApiCopyWithImpl<$Res, $Val extends AttributeForApi>
    implements $AttributeForApiCopyWith<$Res> {
  _$AttributeForApiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttributeForApi
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attribute = null,
    Object? minValue = freezed,
    Object? maxValue = freezed,
  }) {
    return _then(_value.copyWith(
      attribute: null == attribute
          ? _value.attribute
          : attribute // ignore: cast_nullable_to_non_nullable
              as Attribute,
      minValue: freezed == minValue
          ? _value.minValue
          : minValue // ignore: cast_nullable_to_non_nullable
              as num?,
      maxValue: freezed == maxValue
          ? _value.maxValue
          : maxValue // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttributeForApiImplCopyWith<$Res>
    implements $AttributeForApiCopyWith<$Res> {
  factory _$$AttributeForApiImplCopyWith(_$AttributeForApiImpl value,
          $Res Function(_$AttributeForApiImpl) then) =
      __$$AttributeForApiImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Attribute attribute, num? minValue, num? maxValue});
}

/// @nodoc
class __$$AttributeForApiImplCopyWithImpl<$Res>
    extends _$AttributeForApiCopyWithImpl<$Res, _$AttributeForApiImpl>
    implements _$$AttributeForApiImplCopyWith<$Res> {
  __$$AttributeForApiImplCopyWithImpl(
      _$AttributeForApiImpl _value, $Res Function(_$AttributeForApiImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttributeForApi
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attribute = null,
    Object? minValue = freezed,
    Object? maxValue = freezed,
  }) {
    return _then(_$AttributeForApiImpl(
      attribute: null == attribute
          ? _value.attribute
          : attribute // ignore: cast_nullable_to_non_nullable
              as Attribute,
      minValue: freezed == minValue
          ? _value.minValue
          : minValue // ignore: cast_nullable_to_non_nullable
              as num?,
      maxValue: freezed == maxValue
          ? _value.maxValue
          : maxValue // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttributeForApiImpl implements _AttributeForApi {
  const _$AttributeForApiImpl(
      {required this.attribute, this.minValue, this.maxValue});

  factory _$AttributeForApiImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttributeForApiImplFromJson(json);

  @override
  final Attribute attribute;
  @override
  final num? minValue;
  @override
  final num? maxValue;

  @override
  String toString() {
    return 'AttributeForApi(attribute: $attribute, minValue: $minValue, maxValue: $maxValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttributeForApiImpl &&
            (identical(other.attribute, attribute) ||
                other.attribute == attribute) &&
            (identical(other.minValue, minValue) ||
                other.minValue == minValue) &&
            (identical(other.maxValue, maxValue) ||
                other.maxValue == maxValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, attribute, minValue, maxValue);

  /// Create a copy of AttributeForApi
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttributeForApiImplCopyWith<_$AttributeForApiImpl> get copyWith =>
      __$$AttributeForApiImplCopyWithImpl<_$AttributeForApiImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttributeForApiImplToJson(
      this,
    );
  }
}

abstract class _AttributeForApi implements AttributeForApi {
  const factory _AttributeForApi(
      {required final Attribute attribute,
      final num? minValue,
      final num? maxValue}) = _$AttributeForApiImpl;

  factory _AttributeForApi.fromJson(Map<String, dynamic> json) =
      _$AttributeForApiImpl.fromJson;

  @override
  Attribute get attribute;
  @override
  num? get minValue;
  @override
  num? get maxValue;

  /// Create a copy of AttributeForApi
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttributeForApiImplCopyWith<_$AttributeForApiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
