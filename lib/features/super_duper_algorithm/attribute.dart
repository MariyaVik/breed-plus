enum Attribute {
  milk('Удой', 0, 45, 'л/день', 'Удой л/день'),
  fatness('Упитанность', 1, 9, null, 'Упитанность'),
  inbredding(
      'Коэффициент инбридинга (F)', 0, 1, null, 'Коэффициент инбридинга (F)'),
  weightGain('Прирост веса', 0, 1, 'кг/день', 'Прирост веса кг/день'),
  health('Здоровье', 1, 10, null, 'Здоровье (1-10)'),
  fertility('Фертильность', 0, 100, '%', 'Фертильность (%)'),
  worth('Генетическая ценность', 0, 100, 'баллы',
      'Генетическая ценность (баллы)');

  final String name;
  final num min;
  final num max;
  final String? units;
  final String tableName;
  const Attribute(
    this.name,
    this.min,
    this.max,
    this.units,
    this.tableName,
  );
}
