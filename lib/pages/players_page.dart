import 'package:flutter/material.dart';
import 'package:my_first_real_app/utils/db.dart';
import 'package:my_first_real_app/pages/player_detail_page.dart';

class PlayersPage extends StatelessWidget {
  final String teamName;
  final String userType;

  PlayersPage({required this.teamName, required this.userType});

  @override
  Widget build(BuildContext context) {
    final players = PlayersFromDatabase()[teamName] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Jugadores de $teamName'),
        actions: (userType == 'admin' || userType == 'capitan')
            ? [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    // Lógica para agregar un jugador
                  },
                ),
              ]
            : null,
      ),
      body: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          final player = players[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Aquí puedes usar la URL real de la foto de perfil
              ),
              title: Text(player['name']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayerDetailPage(player: player, userType: userType),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}