import 'package:flutter/material.dart';
import 'package:my_first_real_app/utils/db.dart';
import 'package:my_first_real_app/pages/player_detail_page.dart';
import 'package:my_first_real_app/widgets/add_player.dart';

class PlayersPage extends StatefulWidget {
  final String teamName;
  final String userType;

  PlayersPage({required this.teamName, required this.userType});

  @override
  _PlayersPageState createState() => _PlayersPageState();
}

class _PlayersPageState extends State<PlayersPage> {
  List<Map<String, String>> players = [];

  @override
  void initState() {
    super.initState();
    players = PlayersFromDatabase()[widget.teamName] ?? [];
  }

  void _addPlayer(Map<String, String> playerData) {
    setState(() {
      players.add(playerData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jugadores de ${widget.teamName}'),
        actions: (widget.userType == 'admin' || widget.userType == 'capitan')
            ? [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AddPlayerForm(onAddPlayer: _addPlayer),
                    );
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
                    builder: (context) => PlayerDetailPage(player: player, userType: widget.userType),
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