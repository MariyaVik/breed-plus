// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../features/seach/domain/search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchState _$SearchStateFromJson(Map<String, dynamic> json) {
  return _SearchState.fromJson(json);
}

/// @nodoc
mixin _$SearchState {
  Passport? get female => throw _privateConstructorUsedError;
  Attribute? get mainAttribute => throw _privateConstructorUsedError;
  List<Attribute>? get optionAttributes => throw _privateConstructorUsedError;
  List<Passport>? get foundedMales => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call(
      {Passport? female,
      Attribute? mainAttribute,
      List<Attribute>? optionAttributes,
      List<Passport>? foundedMales});

  $PassportCopyWith<$Res>? get female;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? female = freezed,
    Object? mainAttribute = freezed,
    Object? optionAttributes = freezed,
    Object? foundedMales = freezed,
  }) {
    return _then(_value.copyWith(
      female: freezed == female
          ? _value.female
          : female // ignore: cast_nullable_to_non_nullable
              as Passport?,
      mainAttribute: freezed == mainAttribute
          ? _value.mainAttribute
          : mainAttribute // ignore: cast_nullable_to_non_nullable
              as Attribute?,
      optionAttributes: freezed == optionAttributes
          ? _value.optionAttributes
          : optionAttributes // ignore: cast_nullable_to_non_nullable
              as List<Attribute>?,
      foundedMales: freezed == foundedMales
          ? _value.foundedMales
          : foundedMales // ignore: cast_nullable_to_non_nullable
              as List<Passport>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PassportCopyWith<$Res>? get female {
    if (_value.female == null) {
      return null;
    }

    return $PassportCopyWith<$Res>(_value.female!, (value) {
      return _then(_value.copyWith(female: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchStateImplCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$SearchStateImplCopyWith(
          _$SearchStateImpl value, $Res Function(_$SearchStateImpl) then) =
      __$$SearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Passport? female,
      Attribute? mainAttribute,
      List<Attribute>? optionAttributes,
      List<Passport>? foundedMales});

  @override
  $PassportCopyWith<$Res>? get female;
}

/// @nodoc
class __$$SearchStateImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateImpl>
    implements _$$SearchStateImplCopyWith<$Res> {
  __$$SearchStateImplCopyWithImpl(
      _$SearchStateImpl _value, $Res Function(_$SearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? female = freezed,
    Object? mainAttribute = freezed,
    Object? optionAttributes = freezed,
    Object? foundedMales = freezed,
  }) {
    return _then(_$SearchStateImpl(
      female: freezed == female
          ? _value.female
          : female // ignore: cast_nullable_to_non_nullable
              as Passport?,
      mainAttribute: freezed == mainAttribute
          ? _value.mainAttribute
          : mainAttribute // ignore: cast_nullable_to_non_nullable
              as Attribute?,
      optionAttributes: freezed == optionAttributes
          ? _value._optionAttributes
          : optionAttributes // ignore: cast_nullable_to_non_nullable
              as List<Attribute>?,
      foundedMales: freezed == foundedMales
          ? _value._foundedMales
          : foundedMales // ignore: cast_nullable_to_non_nullable
              as List<Passport>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchStateImpl implements _SearchState {
  const _$SearchStateImpl(
      {this.female,
      this.mainAttribute,
      final List<Attribute>? optionAttributes,
      final List<Passport>? foundedMales})
      : _optionAttributes = optionAttributes,
        _foundedMales = foundedMales;

  factory _$SearchStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchStateImplFromJson(json);

  @override
  final Passport? female;
  @override
  final Attribute? mainAttribute;
  final List<Attribute>? _optionAttributes;
  @override
  List<Attribute>? get optionAttributes {
    final value = _optionAttributes;
    if (value == null) return null;
    if (_optionAttributes is EqualUnmodifiableListView)
      return _optionAttributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Passport>? _foundedMales;
  @override
  List<Passport>? get foundedMales {
    final value = _foundedMales;
    if (value == null) return null;
    if (_foundedMales is EqualUnmodifiableListView) return _foundedMales;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SearchState(female: $female, mainAttribute: $mainAttribute, optionAttributes: $optionAttributes, foundedMales: $foundedMales)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStateImpl &&
            (identical(other.female, female) || other.female == female) &&
            (identical(other.mainAttribute, mainAttribute) ||
                other.mainAttribute == mainAttribute) &&
            const DeepCollectionEquality()
                .equals(other._optionAttributes, _optionAttributes) &&
            const DeepCollectionEquality()
                .equals(other._foundedMales, _foundedMales));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      female,
      mainAttribute,
      const DeepCollectionEquality().hash(_optionAttributes),
      const DeepCollectionEquality().hash(_foundedMales));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      __$$SearchStateImplCopyWithImpl<_$SearchStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchStateImplToJson(
      this,
    );
  }
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {final Passport? female,
      final Attribute? mainAttribute,
      final List<Attribute>? optionAttributes,
      final List<Passport>? foundedMales}) = _$SearchStateImpl;

  factory _SearchState.fromJson(Map<String, dynamic> json) =
      _$SearchStateImpl.fromJson;

  @override
  Passport? get female;
  @override
  Attribute? get mainAttribute;
  @override
  List<Attribute>? get optionAttributes;
  @override
  List<Passport>? get foundedMales;
  @override
  @JsonKey(ignore: true)
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
