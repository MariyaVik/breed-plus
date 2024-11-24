import 'package:breed_plus/common/navigation/route_name.dart';
import 'package:breed_plus/features/seach/domain/search_cubit.dart';
import 'package:breed_plus/features/seach/domain/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
        print('555555');
        print(searchState.mainAttributes);
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
                        context.read<AppCubit>().selectTab(0);
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
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: searchState.mainAttributes == null ||
                              (searchState.mainAttributes?.isEmpty ?? true) ||
                              searchState.isloading
                          ? null
                          : () {
                              context.read<SearchCubit>().matchAnimal();
                            },
                      child: searchState.isloading
                          ? CircularProgressIndicator()
                          : Text(searchState.foundedMales != null
                              ? 'Новый поиск'
                              : 'Начать поиск'),
                    ),
                    if (searchState.foundedMales != null)
                      ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                context.pushNamed(
                                  RouteName.result,
                                  extra: [
                                    searchState.female,
                                    searchState.foundedMales![index]
                                  ],
                                );
                              },
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                              'ID партнера ${searchState.foundedMales![index].passport.id}'),
                                        ],
                                      ),
                                      Text(
                                        searchState.foundedMales![index].score
                                            .toStringAsFixed(2),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                    ],
                                  ),
                                ),
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
  const ChooseMainAttribute({super.key});

  @override
  State<ChooseMainAttribute> createState() => _ChooseMainAttributeState();
}

class _ChooseMainAttributeState extends State<ChooseMainAttribute> {
  final List<Attribute> attributes = [
    Attribute.milk,
    Attribute.fatness,
    Attribute.health,
    Attribute.weightGain,
    Attribute.worth,
  ];

  final List<Attribute> selectedAttributes = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Выберите признаки в порядке приоритета'),
        const SizedBox(height: 8),
        Wrap(
          spacing: 4,
          runSpacing: 4,
          children: List<Widget>.generate(
            attributes.length,
            (int index) {
              final attribute = attributes[index];
              final priority = selectedAttributes.indexOf(attribute) + 1;

              return ChoiceChip(
                label: Text(
                  '${attribute.name} ${priority > 0 ? "($priority)" : ""}',
                ),
                selected: selectedAttributes.contains(attribute),
                onSelected: (bool selected) {
                  setState(() {
                    if (selected) {
                      selectedAttributes.add(attribute);
                    } else {
                      selectedAttributes.remove(attribute);
                    }
                    print(selectedAttributes);
                    context
                        .read<SearchCubit>()
                        .selectMainAttribute(selectedAttributes);
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
