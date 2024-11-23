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
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }

  // Метод для выбора файла
  void _pickFile(BuildContext context, bool isGen) async {
    // Для выбора файла можно использовать пакет file_picker
    // Добавьте в pubspec.yaml:
    // dependencies:
    //   file_picker: ^5.2.1

    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
    );
    print(result?.files.single.bytes);

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
          IconButton(
            onPressed: () {
              _showAddOptions(context, true);
            },
            icon: const Icon(Icons.grid_goldenratio),
          ),
          IconButton(
            onPressed: () {
              _showAddOptions(context, false);
            },
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

class MyAnimalCard extends StatelessWidget {
  const MyAnimalCard({
    super.key,
    required this.passport,
  });

  final Passport passport;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
              Container(
                width: 100,
                height: 100,
                color: Colors.grey,
              ),
              Text(passport.id.toString()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(passport.gender.toString()),
                  Text(calculateAge(passport.bday)),
                ],
              ),
              if (passport.gender == Gender.female)
                OutlinedButton(
                  onPressed: () {
                    context.read<SearchCubit>().selectFemale(passport);
                    context.read<AppCubit>().selectTab(0);
                  },
                  child: Text('Выбрать партнера'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
