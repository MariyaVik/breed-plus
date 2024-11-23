import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../super_duper_algorithm/index.dart';
import '../../super_duper_algorithm/passport.dart';

class AnimalDetailsScreen extends StatefulWidget {
  const AnimalDetailsScreen({
    super.key,
    required this.passport,
  });
  final Passport passport;

  @override
  State<AnimalDetailsScreen> createState() => _AnimalDetailsScreenState();
}

class _AnimalDetailsScreenState extends State<AnimalDetailsScreen> {
  late Passport pas;
  final TextEditingController litersCont = TextEditingController();
  final TextEditingController daysCont = TextEditingController();
  @override
  void initState() {
    super.initState();
    pas = widget.passport;
  }

  @override
  void dispose() {
    litersCont.dispose();
    daysCont.dispose();
    super.dispose();
  }

  void getInfo() async {
    pas = (await API.getCow(widget.passport.id)).passport;
    setState(() {});
  }

  void _addMilkInfo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text('Удой'),
              ),
              Text('Количество литров'),
              TextField(
                keyboardType: const TextInputType.numberWithOptions(),
                controller: litersCont,
              ),
              Text('Количество дней'),
              TextField(
                keyboardType: const TextInputType.numberWithOptions(),
                controller: daysCont,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await API.setCowMilk(
                      pas.id,
                      int.parse(daysCont.text),
                      double.parse(litersCont.text),
                    );
                    getInfo();
                    context.pop();
                  },
                  child: const Text('Добавить данные'),
                ),
              )
            ],
          ),
        );
      },
    );
  }

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

  Widget _buildProfileHeader(BuildContext context) {
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
                widget.passport.gender == Gender.male
                    ? Icons.male
                    : Icons.female,
                size: 40,
                color: Colors.blueGrey.shade800,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'ID: ${widget.passport.id}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.passport.breed,
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
                widget.passport.bday.toLocal().toString().split(' ')[0]),
            _buildDetailRow('Отец (ID)', widget.passport.father.toString()),
            _buildDetailRow('Мать (ID)', widget.passport.mother.toString()),
            _buildDetailRow(
                'Молоко (л)', widget.passport.milk?.toString() ?? 'Не указано'),
            _buildDetailRow('Жирность (%)', widget.passport.fatness.toString()),
            _buildDetailRow(
                'Инбридинг (%)', widget.passport.inbredding.toString()),
            _buildDetailRow('Прирост веса (г)',
                widget.passport.weightGain?.toString() ?? 'Не указано'),
            _buildDetailRow('Здоровье', widget.passport.health.toString()),
            _buildDetailRow('Фертильность',
                widget.passport.fertility?.toString() ?? 'Не указано'),
            _buildDetailRow('Ценность', widget.passport.worth.toString()),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              _addMilkInfo(context);
            },
            icon: const Icon(Icons.water_drop_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(context),
            const SizedBox(height: 16),
            _buildProfileDetails(),
          ],
        ),
      ),
    );
  }
}
