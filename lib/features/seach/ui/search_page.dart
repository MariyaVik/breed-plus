import 'package:breed_plus/features/seach/domain/search_cubit.dart';
import 'package:breed_plus/features/seach/domain/search_state.dart';
import 'package:breed_plus/features/super_duper_algorithm/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/domain/app_cubit.dart';
import '../../profile/ui/profile_page.dart';
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
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                        'Пожалуйста, выберите животное, для которого нужно подобрать партнера'),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AppCubit>().selectTab(2);
                      },
                      child: const Text('Перейти к выбору'),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: MyAnimalCard(
                            buttonShow: false,
                            passport: searchState.female!,
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: ChooseMainAttribute(),
                        ),
                      ],
                    ),
                    // Card(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(12),
                    //     child: Row(
                    //       children: [
                    //         Container(
                    //           width: 100,
                    //           height: 100,
                    //           color: Colors.grey,
                    //         ),
                    //         Column(
                    //           children: [
                    //             Text('ID ${searchState.female!.id}'),
                    //             Text('Удой ${searchState.female!.milk}'),
                    //             Text(
                    //                 'Упитанность ${searchState.female!.fatness}'),
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // ChooseMainAttribute(),
                    // if (searchState.mainAttribute != null)
                    //   Text('Main attribute - ${searchState.mainAttribute}'),
                    // OutlinedButton(
                    //   onPressed: () {},
                    //   child: Text('Добавить признак'),
                    // ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: searchState.mainAttribute == null ||
                              searchState.isloading
                          ? null
                          : () {
                              context.read<SearchCubit>().matchAnimal();
                            },
                      child: searchState.isloading
                          ? CircularProgressIndicator()
                          : Text('Начать поиск'),
                    ),
                    if (searchState.foundedMales != null)
                      ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Card(
                              child: Text(
                                searchState.foundedMales![index].score
                                    .toString(),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 4),
                          itemCount: searchState.foundedMales!.length),
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
            spacing: 4,
            runSpacing: 4,
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
