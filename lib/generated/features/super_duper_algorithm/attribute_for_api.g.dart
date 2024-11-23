// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../features/super_duper_algorithm/attribute_for_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttributeForApiImpl _$$AttributeForApiImplFromJson(
        Map<String, dynamic> json) =>
    _$AttributeForApiImpl(
      attribute: $enumDecode(_$AttributeEnumMap, json['attribute']),
      minValue: json['minValue'] as num?,
      maxValue: json['maxValue'] as num?,
    );

Map<String, dynamic> _$$AttributeForApiImplToJson(
        _$AttributeForApiImpl instance) =>
    <String, dynamic>{
      'attribute': _$AttributeEnumMap[instance.attribute]!,
      'minValue': instance.minValue,
      'maxValue': instance.maxValue,
    };

const _$AttributeEnumMap = {
  Attribute.milk: 'milk',
  Attribute.fatness: 'fatness',
  Attribute.inbredding: 'inbredding',
  Attribute.weightGain: 'weightGain',
  Attribute.health: 'health',
  Attribute.fertility: 'fertility',
  Attribute.worth: 'worth',
};
