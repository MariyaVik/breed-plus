// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../features/seach/domain/search_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchStateImpl _$$SearchStateImplFromJson(Map<String, dynamic> json) =>
    _$SearchStateImpl(
      selectedTab: json['selectedTab'] == null
          ? null
          : Passport.fromJson(json['selectedTab'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SearchStateImplToJson(_$SearchStateImpl instance) =>
    <String, dynamic>{
      'selectedTab': instance.selectedTab,
    };
