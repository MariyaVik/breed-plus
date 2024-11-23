import 'package:freezed_annotation/freezed_annotation.dart';
part '../../generated/features/super_duper_algorithm/genotype.freezed.dart';
part '../../generated/features/super_duper_algorithm/genotype.g.dart';
// part 'passport.freezed.dart';

// part 'passport.g.dart';

@freezed
class Genotype with _$Genotype {
  const factory Genotype({
    required String mutationId,
    required int chrom,
    required String pos,
    required String ref, // enum?
    required String alt, // enum?
    required String attribute,
    required double beta,
    required String genotype,
    required int id,
  }) = _Genotype;

  const Genotype._();

  factory Genotype.fromJson(Map<String, Object?> json) =>
      _$GenotypeFromJson(json);
}
