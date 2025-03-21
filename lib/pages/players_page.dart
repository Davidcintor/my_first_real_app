import 'package:flutter/material.dart';
import 'package:my_first_real_app/utils/db.dart';

class PlayersPage extends StatelessWidget {
  final String teamName;

  PlayersPage({required this.teamName});

  @override
  Widget build(BuildContext context) {
    final players = PlayersFromDatabase()[teamName] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Jugadores de $teamName'),
      ),
      body: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          final player = players[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              ),
              title: Text(player['name']!),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID: ${player['id']}'),
                  Text('Fecha de Nacimiento: ${player['dob']}'),
                  Text('Facebook: ${player['facebook']}'),
                  Text('Instagram: ${player['instagram']}'),
                  Text('YouTube: ${player['youtube']}'),
                  Text('Twitch: ${player['twitch']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}