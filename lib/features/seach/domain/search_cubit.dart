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
    resetMainAttribute();
    emit(state.copyWith(female: passport, foundedMales: null));
  }

  void selectMainAttribute(List<Attribute> mainAttribute) {
    print('in state $mainAttribute');
    emit(state.copyWith(mainAttributes: mainAttribute));
  }

  void matchAnimal() async {
    if (state.female != null) {
      emit(state.copyWith(isloading: true));
      final res = await API.matchAnimal(
        state.female!.id,
        state.mainAttributes ?? [Attribute.milk],
      );
      print(res.length);
      // emit(state.copyWith(foundedMales: res));
      // await Future.delayed(Duration(milliseconds: 700));
      emit(state.copyWith(foundedMales: res, isloading: false));
    } else {}
  }

  void updateAttributes(List<AttributeForApi> list) {
    emit(state.copyWith(optionAttributes: list));
  }

  void resetMainAttribute() {
    emit(state.copyWith(mainAttributes: null));
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
