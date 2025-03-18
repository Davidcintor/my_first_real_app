import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  final List<Map<String, String>> matches = [
    {
      'date': '2025-03-14',
      'time': '18:00',
      'team1': 'Equipo A',
      'team2': 'Equipo B',
    },
    {
      'date': '2025-03-15',
      'time': '20:00',
      'team1': 'Equipo C',
      'team2': 'Equipo D',
    },
    // Agrega más datos dummy aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        itemCount: matches.length,
        itemBuilder: (context, index) {
          final match = matches[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Text(match['team1']![0]), // Muestra la primera letra del equipo
            ),
            title: Text('${match['team1']} vs ${match['team2']}'),
            subtitle: Text('${match['date']} a las ${match['time']}'),
            trailing: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Text(match['team2']![0]), // Muestra la primera letra del equipo
            ),
          );
        },
      ),
    );
  }
}