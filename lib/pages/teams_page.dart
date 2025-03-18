import 'package:flutter/material.dart';

class TeamsPage extends StatelessWidget {
  final List<Map<String, String>> teams = [
    {
      'name': 'Equipo A',
      'image': 'https://via.placeholder.com/150', // URL de imagen de ejemplo
    },
    {
      'name': 'Equipo B',
      'image': 'https://via.placeholder.com/150', // URL de imagen de ejemplo
    },
    {
      'name': 'Equipo C',
      'image': 'https://via.placeholder.com/150', // URL de imagen de ejemplo
    },
    {
      'name': 'Equipo D',
      'image': 'https://via.placeholder.com/150', // URL de imagen de ejemplo
    },
    // Agrega más datos dummy aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: teams.length,
        itemBuilder: (context, index) {
          final team = teams[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(team['image']!),
              ),
              title: Text(team['name']!),
            ),
          );
        },
      ),
    );
  }
}