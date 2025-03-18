import 'package:flutter/material.dart';

class StatisticsPage extends StatelessWidget {
  final List<Map<String, String>> matchResults = [
    {
      'date': '2025-03-14',
      'team1': 'Equipo A',
      'team2': 'Equipo B',
      'score': '2-1',
    },
    {
      'date': '2025-03-15',
      'team1': 'Equipo C',
      'team2': 'Equipo D',
      'score': '1-3',
    },
    // Agrega más datos dummy aquí
  ];

  final List<Map<String, String>> topScorers = [
    {
      'player': 'Jugador 1',
      'team': 'Equipo A',
      'goals': '10',
    },
    {
      'player': 'Jugador 2',
      'team': 'Equipo B',
      'goals': '8',
    },
    // Agrega más datos dummy aquí
  ];

  final List<Map<String, String>> topAssists = [
    {
      'player': 'Jugador 3',
      'team': 'Equipo C',
      'assists': '7',
    },
    {
      'player': 'Jugador 4',
      'team': 'Equipo D',
      'assists': '6',
    },
    // Agrega más datos dummy aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Resultados de los Partidos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: matchResults.length,
              itemBuilder: (context, index) {
                final match = matchResults[index];
                final score = match['score']!.split('-');
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Text(match['team1']![0]), // Muestra la primera letra del equipo
                        ),
                        SizedBox(width: 8),
                        Text(
                          score[0],
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('${match['team1']} vs ${match['team2']}'),
                        Text('Fecha: ${match['date']}'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          score[1],
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Text(match['team2']![0]), // Muestra la primera letra del equipo
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Máximos Goleadores',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: topScorers.length,
              itemBuilder: (context, index) {
                final scorer = topScorers[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Jugador: ${scorer['player']}'),
                        Text('Equipo: ${scorer['team']}'),
                        Text('Goles: ${scorer['goals']}'),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Máximos Asistentes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: topAssists.length,
              itemBuilder: (context, index) {
                final assist = topAssists[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Jugador: ${assist['player']}'),
                        Text('Equipo: ${assist['team']}'),
                        Text('Asistencias: ${assist['assists']}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}