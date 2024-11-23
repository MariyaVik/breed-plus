// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../features/super_duper_algorithm/genotype.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Genotype _$GenotypeFromJson(Map<String, dynamic> json) {
  return _Genotype.fromJson(json);
}

/// @nodoc
mixin _$Genotype {
  String get mutationId => throw _privateConstructorUsedError;
  int get chrom => throw _privateConstructorUsedError;
  String get pos => throw _privateConstructorUsedError;
  String get ref => throw _privateConstructorUsedError; // enum?
  String get alt => throw _privateConstructorUsedError; // enum?
  String get attribute => throw _privateConstructorUsedError;
  double get beta => throw _privateConstructorUsedError;
  String get genotype => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenotypeCopyWith<Genotype> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenotypeCopyWith<$Res> {
  factory $GenotypeCopyWith(Genotype value, $Res Function(Genotype) then) =
      _$GenotypeCopyWithImpl<$Res, Genotype>;
  @useResult
  $Res call(
      {String mutationId,
      int chrom,
      String pos,
      String ref,
      String alt,
      String attribute,
      double beta,
      String genotype,
      int id});
}

/// @nodoc
class _$GenotypeCopyWithImpl<$Res, $Val extends Genotype>
    implements $GenotypeCopyWith<$Res> {
  _$GenotypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mutationId = null,
    Object? chrom = null,
    Object? pos = null,
    Object? ref = null,
    Object? alt = null,
    Object? attribute = null,
    Object? beta = null,
    Object? genotype = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      mutationId: null == mutationId
          ? _value.mutationId
          : mutationId // ignore: cast_nullable_to_non_nullable
              as String,
      chrom: null == chrom
          ? _value.chrom
          : chrom // ignore: cast_nullable_to_non_nullable
              as int,
      pos: null == pos
          ? _value.pos
          : pos // ignore: cast_nullable_to_non_nullable
              as String,
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String,
      alt: null == alt
          ? _value.alt
          : alt // ignore: cast_nullable_to_non_nullable
              as String,
      attribute: null == attribute
          ? _value.attribute
          : attribute // ignore: cast_nullable_to_non_nullable
              as String,
      beta: null == beta
          ? _value.beta
          : beta // ignore: cast_nullable_to_non_nullable
              as double,
      genotype: null == genotype
          ? _value.genotype
          : genotype // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenotypeImplCopyWith<$Res>
    implements $GenotypeCopyWith<$Res> {
  factory _$$GenotypeImplCopyWith(
          _$GenotypeImpl value, $Res Function(_$GenotypeImpl) then) =
      __$$GenotypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String mutationId,
      int chrom,
      String pos,
      String ref,
      String alt,
      String attribute,
      double beta,
      String genotype,
      int id});
}

/// @nodoc
class __$$GenotypeImplCopyWithImpl<$Res>
    extends _$GenotypeCopyWithImpl<$Res, _$GenotypeImpl>
    implements _$$GenotypeImplCopyWith<$Res> {
  __$$GenotypeImplCopyWithImpl(
      _$GenotypeImpl _value, $Res Function(_$GenotypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mutationId = null,
    Object? chrom = null,
    Object? pos = null,
    Object? ref = null,
    Object? alt = null,
    Object? attribute = null,
    Object? beta = null,
    Object? genotype = null,
    Object? id = null,
  }) {
    return _then(_$GenotypeImpl(
      mutationId: null == mutationId
          ? _value.mutationId
          : mutationId // ignore: cast_nullable_to_non_nullable
              as String,
      chrom: null == chrom
          ? _value.chrom
          : chrom // ignore: cast_nullable_to_non_nullable
              as int,
      pos: null == pos
          ? _value.pos
          : pos // ignore: cast_nullable_to_non_nullable
              as String,
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String,
      alt: null == alt
          ? _value.alt
          : alt // ignore: cast_nullable_to_non_nullable
              as String,
      attribute: null == attribute
          ? _value.attribute
          : attribute // ignore: cast_nullable_to_non_nullable
              as String,
      beta: null == beta
          ? _value.beta
          : beta // ignore: cast_nullable_to_non_nullable
              as double,
      genotype: null == genotype
          ? _value.genotype
          : genotype // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenotypeImpl extends _Genotype {
  const _$GenotypeImpl(
      {required this.mutationId,
      required this.chrom,
      required this.pos,
      required this.ref,
      required this.alt,
      required this.attribute,
      required this.beta,
      required this.genotype,
      required this.id})
      : super._();

  factory _$GenotypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenotypeImplFromJson(json);

  @override
  final String mutationId;
  @override
  final int chrom;
  @override
  final String pos;
  @override
  final String ref;
// enum?
  @override
  final String alt;
// enum?
  @override
  final String attribute;
  @override
  final double beta;
  @override
  final String genotype;
  @override
  final int id;

  @override
  String toString() {
    return 'Genotype(mutationId: $mutationId, chrom: $chrom, pos: $pos, ref: $ref, alt: $alt, attribute: $attribute, beta: $beta, genotype: $genotype, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenotypeImpl &&
            (identical(other.mutationId, mutationId) ||
                other.mutationId == mutationId) &&
            (identical(other.chrom, chrom) || other.chrom == chrom) &&
            (identical(other.pos, pos) || other.pos == pos) &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.alt, alt) || other.alt == alt) &&
            (identical(other.attribute, attribute) ||
                other.attribute == attribute) &&
            (identical(other.beta, beta) || other.beta == beta) &&
            (identical(other.genotype, genotype) ||
                other.genotype == genotype) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mutationId, chrom, pos, ref, alt,
      attribute, beta, genotype, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenotypeImplCopyWith<_$GenotypeImpl> get copyWith =>
      __$$GenotypeImplCopyWithImpl<_$GenotypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenotypeImplToJson(
      this,
    );
  }
}

abstract class _Genotype extends Genotype {
  const factory _Genotype(
      {required final String mutationId,
      required final int chrom,
      required final String pos,
      required final String ref,
      required final String alt,
      required final String attribute,
      required final double beta,
      required final String genotype,
      required final int id}) = _$GenotypeImpl;
  const _Genotype._() : super._();

  factory _Genotype.fromJson(Map<String, dynamic> json) =
      _$GenotypeImpl.fromJson;

  @override
  String get mutationId;
  @override
  int get chrom;
  @override
  String get pos;
  @override
  String get ref;
  @override // enum?
  String get alt;
  @override // enum?
  String get attribute;
  @override
  double get beta;
  @override
  String get genotype;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$GenotypeImplCopyWith<_$GenotypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
