import 'package:breed_plus/features/base/domain/app_cubit.dart';
import 'package:breed_plus/features/seach/domain/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/mok.dart';
import 'widgets/grid_column_widget.dart';

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
              count: 2,
              children: List.generate(
                passports.length,
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
                        Text(passports[index].id.toString()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(passports[index].gender.toString()),
                            Text(calculateAge(passports[index].bday)),
                          ],
                        ),
                        OutlinedButton(
                          onPressed: () {
                            context
                                .read<SearchCubit>()
                                .selectFemale(passports[index]);
                            context.read<AppCubit>().selectTab(0);
                          },
                          child: Text('Выбрать партнера'),
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

String calculateAge(DateTime birthDate) {
  final DateTime today = DateTime.now();

  int years = today.year - birthDate.year;
  int months = today.month - birthDate.month;
  int days = today.day - birthDate.day;

  // Корректировка, если текущая дата раньше месяца или дня рождения
  if (months < 0 || (months == 0 && days < 0)) {
    years--;
    months += 12;
  }
  if (days < 0) {
    final previousMonth = DateTime(today.year, today.month - 1, birthDate.day);
    days = today.difference(previousMonth).inDays;
    months--;
  }

  return "$years л, $months м";
}
