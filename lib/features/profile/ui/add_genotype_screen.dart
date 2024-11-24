import 'package:breed_plus/features/profile/domain/profile_cubit.dart';
import 'package:breed_plus/features/super_duper_algorithm/passport.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../super_duper_algorithm/genotype.dart';

class AddGenotypeScreen extends StatelessWidget {
  const AddGenotypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Новая мутация'),), body: GenotypeForm(
  onSubmit: (Genotype genotype) {
    print(genotype);
    context.read<ProfileCubit>().addNewGenotype(genotype);
    context.pop();
  },
),);
  }
}



class GenotypeForm extends StatefulWidget {
  final void Function(Genotype formData) onSubmit;

  const GenotypeForm({super.key, required this.onSubmit});

  @override
  State<GenotypeForm> createState() => _GenotypeFormState();
}

enum Ref { A, T, G, C }
enum Alt { A, T, G, C }
enum GenotypeType { AA, AT, TT, GG, CC, AG }

class _GenotypeFormState extends State<GenotypeForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _mutationIdController = TextEditingController();
  final TextEditingController _chromController = TextEditingController();
  final TextEditingController _posController = TextEditingController();
  final TextEditingController _attributeController = TextEditingController();
  final TextEditingController _betaController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  Ref? _selectedRef;
  Alt? _selectedAlt;
  GenotypeType? _selectedGenotype;

  @override
  void dispose() {
    _mutationIdController.dispose();
    _chromController.dispose();
    _posController.dispose();
    _attributeController.dispose();
    _betaController.dispose();
    _idController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() &&
        _selectedRef != null &&
        _selectedAlt != null &&
        _selectedGenotype != null) {
      final formData = Genotype(
        mutationId: _mutationIdController.text,
        chrom: int.parse(_chromController.text),
        pos: int.parse(_posController.text),
        ref: _selectedRef!.name,
        alt: _selectedAlt!.name,
        attribute: _attributeController.text,
        beta: double.parse(_betaController.text),
        genotype: _selectedGenotype!.name,
        id: int.parse(_idController.text),
      );

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
                controller: _mutationIdController,
                decoration: InputDecoration(labelText: 'Mutation ID'),
                validator: (value) => value == null || value.isEmpty ? 'Поле обязательно' : null,
              ),
              TextFormField(
                controller: _chromController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Chrom'),
                validator: (value) => value == null || value.isEmpty ? 'Поле обязательно' : null,
              ),
              TextFormField(
                controller: _posController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Position'),
                validator: (value) => value == null || value.isEmpty ? 'Поле обязательно' : null,
              ),
              DropdownButtonFormField<Ref>(
                value: _selectedRef,
                items: Ref.values
                    .map((ref) => DropdownMenuItem(
                          value: ref,
                          child: Text(ref.toString().split('.').last),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedRef = value;
                  });
                },
                decoration: InputDecoration(labelText: 'Ref'),
                validator: (value) => value == null ? 'Поле обязательно' : null,
              ),
              DropdownButtonFormField<Alt>(
                value: _selectedAlt,
                items: Alt.values
                    .map((alt) => DropdownMenuItem(
                          value: alt,
                          child: Text(alt.toString().split('.').last),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedAlt = value;
                  });
                },
                decoration: InputDecoration(labelText: 'Alt'),
                validator: (value) => value == null ? 'Поле обязательно' : null,
              ),
              TextFormField(
                controller: _attributeController,
                decoration: InputDecoration(labelText: 'Attribute'),
                validator: (value) => value == null || value.isEmpty ? 'Поле обязательно' : null,
              ),
              TextFormField(
                controller: _betaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Beta'),
                validator: (value) => value == null || value.isEmpty ? 'Поле обязательно' : null,
              ),
              DropdownButtonFormField<GenotypeType>(
                value: _selectedGenotype,
                items: GenotypeType.values
                    .map((genotype) => DropdownMenuItem(
                          value: genotype,
                          child: Text(genotype.toString().split('.').last),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedGenotype = value;
                  });
                },
                decoration: InputDecoration(labelText: 'Genotype'),
                validator: (value) => value == null ? 'Поле обязательно' : null,
              ),
              TextFormField(
                controller: _idController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'ID'),
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
