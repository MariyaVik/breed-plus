// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../features/super_duper_algorithm/passport.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PassportImpl _$$PassportImplFromJson(Map<String, dynamic> json) =>
    _$PassportImpl(
      id: (json['id'] as num).toInt(),
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      breed: json['breed'] as String,
      bday: DateTime.parse(json['bday'] as String),
      father: (json['father'] as num).toInt(),
      mother: (json['mother'] as num).toInt(),
      milk: (json['milk'] as num?)?.toDouble(),
      fatness: (json['fatness'] as num?)?.toInt(),
      inbredding: (json['inbredding'] as num?)?.toDouble(),
      weightGain: (json['weightGain'] as num?)?.toDouble(),
      health: (json['health'] as num?)?.toInt(),
      fertility: (json['fertility'] as num?)?.toInt(),
      worth: (json['worth'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PassportImplToJson(_$PassportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gender': _$GenderEnumMap[instance.gender]!,
      'breed': instance.breed,
      'bday': instance.bday.toIso8601String(),
      'father': instance.father,
      'mother': instance.mother,
      'milk': instance.milk,
      'fatness': instance.fatness,
      'inbredding': instance.inbredding,
      'weightGain': instance.weightGain,
      'health': instance.health,
      'fertility': instance.fertility,
      'worth': instance.worth,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
};
