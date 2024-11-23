import 'package:flutter/material.dart';

import '../../super_duper_algorithm/passport.dart';

class AnimalDetailsScreen extends StatelessWidget {
  AnimalDetailsScreen({super.key});

  final passport = Passport(
    id: 19,
    gender: Gender.female,
    breed: "Герефорд",
    bday: DateTime.parse("2018-11-08"),
    father: 1212,
    mother: 7026,
    milk: 27.25934223,
    fatness: 4,
    inbredding: 0.1,
    weightGain: null,
    health: 9,
    fertility: 81,
    worth: 92,
  );

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blueGrey.shade100,
              child: Icon(
                passport.gender == Gender.male ? Icons.male : Icons.female,
                size: 40,
                color: Colors.blueGrey.shade800,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'ID: ${passport.id}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              passport.breed,
              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileDetails() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Детали:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildDetailRow('Дата рождения',
                passport.bday.toLocal().toString().split(' ')[0]),
            _buildDetailRow('Отец (ID)', passport.father.toString()),
            _buildDetailRow('Мать (ID)', passport.mother.toString()),
            _buildDetailRow(
                'Молоко (л)', passport.milk?.toString() ?? 'Не указано'),
            _buildDetailRow('Жирность (%)', passport.fatness.toString()),
            _buildDetailRow('Инбридинг (%)', passport.inbredding.toString()),
            _buildDetailRow('Прирост веса (г)',
                passport.weightGain?.toString() ?? 'Не указано'),
            _buildDetailRow('Здоровье', passport.health.toString()),
            _buildDetailRow(
                'Фертильность', passport.fertility?.toString() ?? 'Не указано'),
            _buildDetailRow('Ценность', passport.worth.toString()),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 16),
            _buildProfileDetails(),
          ],
        ),
      ),
    );
  }
}
