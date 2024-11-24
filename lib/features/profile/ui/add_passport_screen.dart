import 'package:breed_plus/features/profile/domain/profile_cubit.dart';
import 'package:breed_plus/features/super_duper_algorithm/passport.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddPassportScreen extends StatelessWidget {
  const AddPassportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: AnimalPassportForm(
  onSubmit: (Passport passport) {
    print(passport);
    context.read<ProfileCubit>().addNewPassport(passport);
    context.pop();
  },
),);
  }
}




enum Breed { shvitskaya, golshinskaya, simmental, ayrshirskaya, gereford }

class AnimalPassportForm extends StatefulWidget {
  final void Function(Passport passport) onSubmit;

  const AnimalPassportForm({super.key, required this.onSubmit});

  @override
  State<AnimalPassportForm> createState() => _AnimalPassportFormState();
}

class _AnimalPassportFormState extends State<AnimalPassportForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _fatherController = TextEditingController();
  final TextEditingController _motherController = TextEditingController();
  final TextEditingController _milkController = TextEditingController();
  final TextEditingController _fatnessController = TextEditingController();
  final TextEditingController _inbreedingController = TextEditingController();
  final TextEditingController _weightGainController = TextEditingController();
  final TextEditingController _healthController = TextEditingController();
  final TextEditingController _fertilityController = TextEditingController();
  final TextEditingController _worthController = TextEditingController();

  Gender? _selectedGender;
  Breed? _selectedBreed;
  DateTime? _selectedBday;

  @override
  void dispose() {
    _idController.dispose();
    _fatherController.dispose();
    _motherController.dispose();
    _milkController.dispose();
    _fatnessController.dispose();
    _inbreedingController.dispose();
    _weightGainController.dispose();
    _healthController.dispose();
    _fertilityController.dispose();
    _worthController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedBday) {
      setState(() {
        _selectedBday = picked;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && _selectedGender != null && _selectedBreed != null && _selectedBday != null) {
      final formData = Passport(id: int.parse(_idController.text), gender: _selectedGender ?? Gender.female, breed: _selectedBreed?.name ?? '', bday: _selectedBday?? DateTime.now(), father: int.parse(_fatherController.text), mother: int.parse(_motherController.text), fatness: int.parse(_fatnessController.text), inbredding: double.parse(_inbreedingController.text), health: int.parse(_healthController.text), worth: int.parse(_worthController.text),
      milk: _milkController.text.isEmpty ? null : double.parse(_milkController.text),
      weightGain: _weightGainController.text.isEmpty ? null : double.parse(_weightGainController.text),
      fertility: _fertilityController.text.isEmpty ? null : int.parse(_fertilityController.text),);
      

      widget.onSubmit(formData);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Пожалуйста, заполните все обязательные поля')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _idController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'ID'),
                validator: (value) => value == null || value.isEmpty ? 'Поле обязательно' : null,
              ),
              DropdownButtonFormField<Gender>(
                value: _selectedGender,
                items: Gender.values
                    .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender == Gender.male ? 'Самец' : 'Самка'),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
                decoration: InputDecoration(labelText: 'Пол'),
                validator: (value) => value == null ? 'Поле обязательно' : null,
              ),
              DropdownButtonFormField<Breed>(
                value: _selectedBreed,
                items: Breed.values
                    .map((breed) => DropdownMenuItem(
                          value: breed,
                          child: Text(breed.toString().split('.').last),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedBreed = value;
                  });
                },
                decoration: InputDecoration(labelText: 'Порода'),
                validator: (value) => value == null ? 'Поле обязательно' : null,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: _pickDate,
                    child: Text(_selectedBday == null ? 'Выбрать дату рождения' : _selectedBday!.toLocal().toString().split(' ')[0]),
                  ),
                  if (_selectedBday == null)
                    Text(
                      '*',
                      style: TextStyle(color: Colors.red),
                    ),
                ],
              ),
              TextFormField(
                controller: _fatherController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'ID отца'),
                validator: (value) => value == null || value.isEmpty ? 'Поле обязательно' : null,
              ),
              TextFormField(
                controller: _motherController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'ID матери'),
                validator: (value) => value == null || value.isEmpty ? 'Поле обязательно' : null,
              ),
              TextFormField(
                controller: _milkController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Удой (л/день)'),
              ),
              TextFormField(
                controller: _fatnessController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Упитанность'),
                validator: (value) => value == null || value.isEmpty ? 'Поле обязательно' : null,
              ),
              TextFormField(
                controller: _inbreedingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Коэффициент инбридинга (F)'),
                validator: (value) => value == null || value.isEmpty ? 'Поле обязательно' : null,
              ),
              TextFormField(
                controller: _weightGainController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Прирост веса (кг/день)'),
              ),
              TextFormField(
                controller: _healthController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Здоровье'),
                validator: (value) => value == null || value.isEmpty ? 'Поле обязательно' : null,
              ),
              TextFormField(
                controller: _fertilityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Фертильность (%)'),
              ),
              TextFormField(
                controller: _worthController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Генетическая ценность (баллы)'),
                validator: (value) => value == null || value.isEmpty ? 'Поле обязательно' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Добавить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
