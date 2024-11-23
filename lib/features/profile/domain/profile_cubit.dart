import 'package:breed_plus/features/super_duper_algorithm/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState.initial());

  // Метод загрузки данных
  Future<void> fetchPassports() async {
    emit(const ProfileState.loading());
    try {
      final passports = await API.getMyAnimales();
      if (passports.isEmpty) {
        emit(const ProfileState.empty());
      } else {
        emit(ProfileState.loaded(passports));
      }
    } catch (e) {
      emit(ProfileState.error('Ошибка загрузки данных: $e'));
    }
  }

  // Метод загрузки данных из файла и обновления списка
  Future<void> loadXlsxPassport(List<int> bytes) async {
    try {
      await API.loadXlsxPassport(bytes);
      await fetchPassports(); // Перезагружаем список
    } catch (e) {
      emit(ProfileState.error('Ошибка загрузки файла: $e'));
    }
  }
}
