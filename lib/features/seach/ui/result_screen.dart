import 'package:breed_plus/features/profile/ui/profile_page.dart';
import 'package:breed_plus/features/super_duper_algorithm/passport.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../super_duper_algorithm/index.dart';
import '../domain/search_state.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.info});
  final List<dynamic> info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Потомство'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text('Выбранная особь'),
                    MyAnimalCard(
                      passport: info[0] as Passport,
                      buttonShow: false,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text('Кандидат в пару'),
                    MyAnimalCard(
                      passport: (info[1] as ReproductionResponse).passport,
                      buttonShow: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Text(
              'Возможное потомство',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  '50%',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                  child: Card(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Удой'),
                          Text('24'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Упитанность'),
                          Text('3'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Здоровье'),
                          Text('8'),
                        ],
                      )
                    ],
                  ),
                ),
              )),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  '25%',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                  child: Card(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Удой'),
                          Text('22'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Упитанность'),
                          Text('4'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Здоровье'),
                          Text('6'),
                        ],
                      )
                    ],
                  ),
                ),
              )),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  '25%',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                  child: Card(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Удой'),
                          Text('15'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Упитанность'),
                          Text('2'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Здоровье'),
                          Text('7'),
                        ],
                      )
                    ],
                  ),
                ),
              )),
            ],
          ),
          // Text((info[1] as ReproductionResponse).offspringTraits.toString()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Center(
                child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Функция в разработке')),
                      );
                    },
                    child: Text('Сохранить результат'))),
          ),
        ],
      ),
    );
  }
}
