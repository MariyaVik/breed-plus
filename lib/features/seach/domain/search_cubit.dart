import 'package:breed_plus/features/profile/data/mok.dart';
import 'package:breed_plus/features/super_duper_algorithm/attribute.dart';
import 'package:breed_plus/features/super_duper_algorithm/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../super_duper_algorithm/attribute_for_api.dart';
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

  void matchAnimal() async {
    if (state.female != null) {
      emit(state.copyWith(isloading: true));
      final res =
          passports.sublist(0, 6); // await API.matchAnimal(state.female!.id);
      // emit(state.copyWith(
      //     foundedMales: res.map<Passport>((e) => e.passport).toList()));
      await Future.delayed(Duration(milliseconds: 700));
      emit(state.copyWith(foundedMales: res, isloading: false));
    } else {}
  }

  void updateAttributes(List<AttributeForApi> list) {
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
