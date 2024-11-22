import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/features/base/domain/app_state.freezed.dart';
part '../../../generated/features/base/domain/app_state.g.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(0) int selectedTab,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);
}
