// import 'attribute.dart';

// class AttributeForApi {
//   final Attribute attributeName; // или сделать строку Attribute.name
//   final num? minValue;
//   final num? maxValue;

//   AttributeForApi({required this.attributeName, this.minValue, this.maxValue});
// }

import 'package:freezed_annotation/freezed_annotation.dart';

import 'attribute.dart';

part '../../generated/features/super_duper_algorithm/attribute_for_api.freezed.dart';
part '../../generated/features/super_duper_algorithm/attribute_for_api.g.dart';

@freezed
class AttributeForApi with _$AttributeForApi {
  const factory AttributeForApi({
    required Attribute attribute,
    num? minValue,
    num? maxValue,
  }) = _AttributeForApi;

  factory AttributeForApi.fromJson(Map<String, dynamic> json) =>
      _$AttributeForApiFromJson(json);
}
