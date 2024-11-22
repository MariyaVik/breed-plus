import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  void selectTab(int index) {
    emit(state.copyWith(selectedTab: index));
  }
}
