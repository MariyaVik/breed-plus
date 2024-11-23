import 'package:breed_plus/features/super_duper_algorithm/attribute.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../super_duper_algorithm/attribute_for_api.dart';
import '../../super_duper_algorithm/passport.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState());

  // final List<AttributeForApi> _temporaryAttributes = [];

  // void toggleAddingAttribute() {
  //   final isAddingAttribute = !(state.isAddingAttribute ?? false);
  //   emit(state.copyWith(isAddingAttribute: isAddingAttribute));
  // }

  // void toggleNewAttribute() {
  //   final isAddingAttribute = !(state.isNewAttribute ?? false);
  //   emit(state.copyWith(isNewAttribute: isAddingAttribute));
  // }

  void selectFemale(Passport passport) {
    emit(state.copyWith(female: passport));
  }

  void selectMainAttribute(Attribute mainAttribute) {
    emit(state.copyWith(mainAttribute: mainAttribute));
  }

  void updateAttributes(List<AttributeForApi> list) {
    print(list);
    emit(state.copyWith(optionAttributes: list));
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
