import 'package:flutter/material.dart';

class GridColumnWidget extends StatelessWidget {
  final int count;
  final List<Widget> children;

  const GridColumnWidget({
    super.key,
    required this.count,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    List<List<Widget>> rows = [];
    for (int i = 0; i < children.length; i += count) {
      rows.add(children.sublist(
        i,
        i + count > children.length ? children.length : i + count,
      ));
    }
    if (rows.isNotEmpty && rows.last.length < count) {
      int remainingSpaces = count - rows.last.length;
      rows.last.addAll(List.generate(remainingSpaces, (_) => const Spacer()));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rows.map((row) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: row.map((widget) {
            return Expanded(child: widget);
          }).toList(),
        );
      }).toList(),
    );
  }
}
