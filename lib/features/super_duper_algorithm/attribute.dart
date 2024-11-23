enum Attribute {
  milk('Удой', 0, 25, 'л/день'),
  fatness('Упитанность', 1, 9, null),
  inbredding('Коэффициент инбридинга (F)', 0, 1, null),
  weightGain('Прирост веса', 0, 1, 'кг/день'),
  health('Здоровье', 1, 10, null),
  fertility('Фертильность', 0, 100, '%'),
  worth('Генетическая ценность', 0, 100, 'баллы');

  final String name;
  final num min;
  final num max;
  final String? units;
  const Attribute(
    this.name,
    this.min,
    this.max,
    this.units,
  );
}
