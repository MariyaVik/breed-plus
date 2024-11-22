import 'package:freezed_annotation/freezed_annotation.dart';
part '../../generated/features/super_duper_algorithm/passport.freezed.dart';
part '../../generated/features/super_duper_algorithm/passport.g.dart';
// part 'passport.freezed.dart';

// part 'passport.g.dart';

@freezed
class Passport with _$Passport {
  const factory Passport({
    required int id,
    required Gender gender,
    required String breed, // enum ?
    required DateTime bday,
    required int father,
    required int mother,
    double? milk,
    required fatness,
    required inbredding,
    double? weightGain,
    required health,
    int? fertility,
    required worth,
  }) = _Passport;

  const Passport._();

  factory Passport.fromJson(Map<String, Object?> json) =>
      _$PassportFromJson(json);
}

enum Gender {
  male,
  female,
}
