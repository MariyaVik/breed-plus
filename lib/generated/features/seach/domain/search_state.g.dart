// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../features/seach/domain/search_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchStateImpl _$$SearchStateImplFromJson(Map<String, dynamic> json) =>
    _$SearchStateImpl(
      female: json['female'] == null
          ? null
          : Passport.fromJson(json['female'] as Map<String, dynamic>),
      mainAttribute:
          $enumDecodeNullable(_$AttributeEnumMap, json['mainAttribute']),
      optionAttributes: (json['optionAttributes'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$AttributeEnumMap, e))
          .toList(),
      foundedMales: (json['foundedMales'] as List<dynamic>?)
          ?.map((e) => Passport.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SearchStateImplToJson(_$SearchStateImpl instance) =>
    <String, dynamic>{
      'female': instance.female,
      'mainAttribute': _$AttributeEnumMap[instance.mainAttribute],
      'optionAttributes': instance.optionAttributes
          ?.map((e) => _$AttributeEnumMap[e]!)
          .toList(),
      'foundedMales': instance.foundedMales,
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
