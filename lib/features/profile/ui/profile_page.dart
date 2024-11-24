import 'dart:io';

import 'package:breed_plus/common/error_page.dart';
import 'package:breed_plus/common/navigation/route_name.dart';
import 'package:breed_plus/features/base/domain/app_cubit.dart';
import 'package:breed_plus/features/seach/domain/search_cubit.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../super_duper_algorithm/passport.dart';
import '../data/mok.dart';
import '../domain/profile_cubit.dart';
import '../domain/profile_state.dart';
import 'widgets/grid_column_widget.dart';

enum AddingType { passport, genotype }

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // Модальное окно выбора действия
  void _showAddOptions(BuildContext context, bool isGen) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Загрузка ${isGen ? "мутаций" : "паспортов"}'),
              Divider(),
              ListTile(
                leading: Icon(Icons.file_upload),
                title: Text('Из файла'),
                onTap: () {
                  Navigator.pop(context); // Закрыть BottomSheet
                  _pickFile(context, isGen);
                },
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Вручную'),
                onTap: () {
                  context.pop();
                  isGen
                      ? context.pushNamed(RouteName.addGenotype)
                      : context.pushNamed(RouteName.addPassport);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _pickFile(BuildContext context, bool isGen) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
    );

    if (result != null && result.files.single.bytes != null) {
      final fileBytes = result.files.single.bytes!;
      isGen
          ? await context.read<ProfileCubit>().loadXlsxGenotypes(fileBytes)
          : await context
              .read<ProfileCubit>()
              .loadXlsxPassport(fileBytes); // Загрузка в Cubit
    } else if (result != null && result.files.single.path != null) {
      final filePath = result.files.single.path!;
      final fileBytes = await File(filePath).readAsBytes();
      isGen
          ? await context.read<ProfileCubit>().loadXlsxGenotypes(fileBytes)
          : await context.read<ProfileCubit>().loadXlsxPassport(fileBytes);
      print('Файл прочитан вручную: ${fileBytes.length} байт');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Файл не выбран')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Моя ферма'),
        actions: [
          PopupMenuButton<AddingType>(
            onSelected: (value) {
              if (value == AddingType.passport) {
                _showAddOptions(context, false);
              } else if (value == AddingType.genotype) {
                _showAddOptions(context, true);
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<AddingType>>[
              const PopupMenuItem<AddingType>(
                value: AddingType.passport,
                child: Text('Паспорта'),
              ),
              const PopupMenuItem<AddingType>(
                value: AddingType.genotype,
                child: Text('Мутации'),
              ),
            ],
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return state.when(
            initial: () => Center(child: Text('Загрузка данных')),
            loading: () => Center(child: CircularProgressIndicator()),
            loaded: (passports) => SingleChildScrollView(
              child: GridColumnWidget(
                count: 2,
                children: List.generate(
                  passports.length,
                  (index) => MyAnimalCard(
                    passport: passports[index],
                  ),
                ),
              ),
            ),
            empty: () => Center(child: Text('Данные отсутствуют')),
            error: (message) => Center(child: Text(message)),
          );
        },
      ),
    );
  }
}

String calculateAge(DateTime birthDate) {
  final DateTime today = DateTime.now();

  int years = today.year - birthDate.year;
  int months = today.month - birthDate.month;
  int days = today.day - birthDate.day;

  if (months < 0 || (months == 0 && days < 0)) {
    years--;
    months += 12;
  }
  if (days < 0) {
    final previousMonth = DateTime(today.year, today.month - 1, birthDate.day);
    days = today.difference(previousMonth).inDays;
    months--;
  }
  final yearName = getWordOrg(years, 'г', 'г', 'л');
  return "$years$yearName $monthsм";
}

class MyAnimalCard extends StatelessWidget {
  const MyAnimalCard({
    super.key,
    required this.passport,
    this.buttonShow = true,
  });

  final Passport passport;
  final bool buttonShow;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        context.pushNamed(RouteName.details, extra: passport);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 12,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimalPhoto(passport: passport),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('ID '),
                          Text(
                            passport.id.toString(),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      Text(calculateAge(passport.bday)),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  children: [
                    if (passport.gender == Gender.female)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Удой'),
                          Text(
                              passport.milk?.toStringAsFixed(2) ?? 'Не указан'),
                        ],
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Упитанность'),
                        Text(passport.fatness.toString()),
                      ],
                    ),
                  ],
                ),
              ),

              // if (passport.gender == Gender.female)
              if (buttonShow)
                OutlinedButton(
                  onPressed: () {
                    context.read<SearchCubit>().selectFemale(passport);
                    context.read<AppCubit>().selectTab(1);
                  },
                  child: Text('Выбрать пару'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimalPhoto extends StatelessWidget {
  const AnimalPhoto({
    super.key,
    required this.passport,
  });

  final Passport passport;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: Colors.grey,
      ),
      width: 50,
      height: 50,
      child: Icon(
        passport.gender == Gender.male ? Icons.male : Icons.female,
        size: 40,
        color: Colors.blueGrey.shade800,
      ),
    );
  }
}

String getWordOrg(int num, String one, String two, String five) {
  num %= 100;
  if (num >= 5 && num <= 20) {
    return five;
  }
  num %= 10;
  if (num == 1) {
    return one;
  }
  if (num >= 2 && num <= 4) {
    return two;
  }
  return five;
}
