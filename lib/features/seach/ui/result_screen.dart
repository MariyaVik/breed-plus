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
        children: [
          Row(
            children: [
              Expanded(
                child: MyAnimalCard(
                  passport: info[0] as Passport,
                  buttonShow: false,
                ),
              ),
              Expanded(
                child: MyAnimalCard(
                  passport: (info[1] as ReproductionResponse).passport,
                  buttonShow: false,
                ),
              ),
            ],
          ),
          // Text()
        ],
      ),
    );
  }
}
