import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Моя ферма'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GridColumnWidget(
              count: 3,
              children: List.generate(
                5,
                (index) => Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 12,
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.grey,
                        ),
                        Text('ИМЯ'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('пол'),
                            Text('возраст'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridColumnWidget extends StatelessWidget {
  final int count;
  final List<Widget> children;

  const GridColumnWidget({
    Key? key,
    required this.count,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Разбиваем список виджетов на строки
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
    // Создаём строки виджетов
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
