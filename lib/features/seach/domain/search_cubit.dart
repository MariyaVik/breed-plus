import 'package:breed_plus/features/super_duper_algorithm/attribute.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../super_duper_algorithm/passport.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState());

  void selectFemale(Passport passport) {
    emit(state.copyWith(female: passport));
  }

  void selectMainAttribute(Attribute mainAttribute) {
    emit(state.copyWith(mainAttribute: mainAttribute));
  }

  void addOptionAttribute(Attribute attribute) {
    List<Attribute> attributes = state.optionAttributes ?? [];
    attributes.add(attribute);
    emit(state.copyWith(optionAttributes: attributes));
  }

  void resetMainAttribute() {
    emit(state.copyWith(mainAttribute: null));
  }

  void resetOptionAttributes() {
    emit(state.copyWith(optionAttributes: null));
  }

  void resetSelectedFemale() {
    resetMainAttribute();
    resetOptionAttributes();
    emit(state.copyWith(female: null));
  }
}
