import 'package:freezed_annotation/freezed_annotation.dart';

import '../../super_duper_algorithm/attribute.dart';
import '../../super_duper_algorithm/attribute_for_api.dart';
import '../../super_duper_algorithm/index.dart';
import '../../super_duper_algorithm/passport.dart';

part '../../../generated/features/seach/domain/search_state.freezed.dart';
// part '../../../generated/features/seach/domain/search_state.g.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    Passport? female,
    List<Attribute>? mainAttributes,
    List<AttributeForApi>? optionAttributes,
    List<ReproductionResponse>? foundedMales,
    @Default(false) bool isloading,
  }) = _SearchState;

  // factory SearchState.fromJson(Map<String, dynamic> json) =>
  //     _$SearchStateFromJson(json);
}
