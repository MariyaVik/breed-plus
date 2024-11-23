// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../features/super_duper_algorithm/genotype.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenotypeImpl _$$GenotypeImplFromJson(Map<String, dynamic> json) =>
    _$GenotypeImpl(
      mutationId: json['mutationId'] as String,
      chrom: (json['chrom'] as num).toInt(),
      pos: (json['pos'] as num).toInt(),
      ref: json['ref'] as String,
      alt: json['alt'] as String,
      attribute: json['attribute'] as String,
      beta: (json['beta'] as num).toDouble(),
      genotype: json['genotype'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$$GenotypeImplToJson(_$GenotypeImpl instance) =>
    <String, dynamic>{
      'mutationId': instance.mutationId,
      'chrom': instance.chrom,
      'pos': instance.pos,
      'ref': instance.ref,
      'alt': instance.alt,
      'attribute': instance.attribute,
      'beta': instance.beta,
      'genotype': instance.genotype,
      'id': instance.id,
    };
