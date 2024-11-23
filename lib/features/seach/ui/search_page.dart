import 'package:breed_plus/features/seach/domain/search_cubit.dart';
import 'package:breed_plus/features/seach/domain/search_state.dart';
import 'package:breed_plus/features/super_duper_algorithm/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/domain/app_cubit.dart';
import '../../super_duper_algorithm/attribute.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Поиск'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<SearchCubit>().resetSelectedFemale();
            },
            icon: const Icon(Icons.filter_alt),
          ),
        ],
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, searchState) {
        return searchState.female == null
            ? Column(
                children: [
                  Text(
                      'Пожалуйста, выберите самку, для которой нужно подобрать партнера'),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AppCubit>().selectTab(2);
                    },
                    child: Text('Перейти к выбору'),
                  ),
                ],
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Text('Выьираем партнера для ${searchState.female!.id}'),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              color: Colors.grey,
                            ),
                            Column(
                              children: [
                                Text('Особь № ${searchState.female!.id}'),
                                Text('Удой ${searchState.female!.milk}'),
                                Text(
                                    'Упитанность ${searchState.female!.fatness}'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    ChooseMainAttribute(),
                    // if (searchState.mainAttribute != null)
                    //   Text('Main attribute - ${searchState.mainAttribute}'),
                    // OutlinedButton(
                    //   onPressed: () {},
                    //   child: Text('Добавить признак'),
                    // ),
                    ElevatedButton(
                      onPressed: searchState.mainAttribute == null
                          ? null
                          : () {
                              context.read<SearchCubit>().matchAnimal();
                            },
                      child: Text('Начать поиск'),
                    ),
                  ],
                ),
              );
      }),
    );
  }
}

class ChooseMainAttribute extends StatefulWidget {
  const ChooseMainAttribute({
    super.key,
  });

  @override
  State<ChooseMainAttribute> createState() => _ChooseMainAttributeState();
}

class _ChooseMainAttributeState extends State<ChooseMainAttribute> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
        builder: (context, searchState) {
      return Column(
        children: [
          Text('Выберите признак'),
          Wrap(
            children: List<Widget>.generate(
              Attribute.values.length,
              (int index) {
                return ChoiceChip(
                  label: Text(Attribute.values[index].name),
                  selected:
                      searchState.mainAttribute == Attribute.values[index],
                  onSelected: (bool selected) {
                    context
                        .read<SearchCubit>()
                        .selectMainAttribute(Attribute.values[index]);
                  },
                );
              },
            ).toList(),
          ),
        ],
      );
    });
  }
}
