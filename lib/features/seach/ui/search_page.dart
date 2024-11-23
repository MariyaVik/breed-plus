import 'package:breed_plus/features/seach/domain/search_cubit.dart';
import 'package:breed_plus/features/seach/domain/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/domain/app_cubit.dart';

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
                    searchState.mainAttribute == null
                        ? Column(
                            children: [
                              Text('Выберите признак'),
                            ],
                          )
                        : Column(
                            children: [
                              Text(
                                  'Main attribute - ${searchState.mainAttribute}'),
                            ],
                          ),
                  ],
                ),
              );
      }),
    );
  }
}
