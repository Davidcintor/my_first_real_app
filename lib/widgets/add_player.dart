import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class AddPlayerForm extends StatefulWidget {
  final Function(Map<String, String>) onAddPlayer;

  AddPlayerForm({required this.onAddPlayer});

  @override
  _AddPlayerFormState createState() => _AddPlayerFormState();
}

class _AddPlayerFormState extends State<AddPlayerForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _playerData = {
    'id': '',
    'name': '',
    'dob': '',
    'facebook': '',
    'instagram': '',
    'youtube': '',
    'twitch': '',
    'profileImage': '',
  };
  DateTime? _selectedDate;
  XFile? _selectedImage;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
        _playerData['dob'] = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    });
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = pickedImage;
        _playerData['profileImage'] = pickedImage.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Agregar Jugador'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: _selectedImage != null
                    ? FileImage(File(_selectedImage!.path))
                    : null,
                child: _selectedImage == null
                    ? Icon(Icons.person, size: 40)
                    : null,
              ),
              TextButton(
                onPressed: _pickImage,
                child: Text('Seleccionar Imagen'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'ID'),
                onSaved: (value) {
                  _playerData['id'] = value ?? '';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el ID';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre'),
                onSaved: (value) {
                  _playerData['name'] = value ?? '';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Fecha de Nacimiento',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                readOnly: true,
                onTap: _presentDatePicker,
                controller: TextEditingController(
                  text: _selectedDate == null
                      ? ''
                      : DateFormat('yyyy-MM-dd').format(_selectedDate!),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor seleccione la fecha de nacimiento';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Facebook (opcional)'),
                onSaved: (value) {
                  _playerData['facebook'] = value ?? '';
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Instagram (opcional)'),
                onSaved: (value) {
                  _playerData['instagram'] = value ?? '';
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'YouTube (opcional)'),
                onSaved: (value) {
                  _playerData['youtube'] = value ?? '';
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Twitch (opcional)'),
                onSaved: (value) {
                  _playerData['twitch'] = value ?? '';
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              widget.onAddPlayer(_playerData);
              Navigator.of(context).pop();
            }
          },
          child: Text('Agregar'),
        ),
      ],
    );
  }
}