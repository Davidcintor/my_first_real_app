import 'package:flutter/material.dart';

class PlayerDetailPage extends StatelessWidget {
  final Map<String, String> player;
  final String userType;

  PlayerDetailPage({required this.player, required this.userType});

  void _deletePlayer(BuildContext context) {
    // Lógica para eliminar el jugador
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(player['name']!),
        actions: userType == 'admin'
            ? [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deletePlayer(context),
                ),
              ]
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
  }
}