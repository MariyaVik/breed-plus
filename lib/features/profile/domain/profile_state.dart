import 'package:breed_plus/features/super_duper_algorithm/passport.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/features/profile/domain/profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = ProfileInitial;
  const factory ProfileState.loading() = ProfileLoading;
  const factory ProfileState.loaded(List<Passport> passports) = ProfileLoaded;
  const factory ProfileState.empty() = ProfileEmpty;
  const factory ProfileState.error(String message) = ProfileError;
}
