import 'package:freezed_annotation/freezed_annotation.dart';

import '../../super_duper_algorithm/attribute.dart';
import '../../super_duper_algorithm/passport.dart';

part '../../../generated/features/seach/domain/search_state.freezed.dart';
part '../../../generated/features/seach/domain/search_state.g.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    Passport? female,
    Attribute? mainAttribute,
    List<Attribute>? optionAttributes,
    List<Passport>? foundedMales,
  }) = _SearchState;

  factory SearchState.fromJson(Map<String, dynamic> json) =>
      _$SearchStateFromJson(json);
}
