import 'package:flutter/material.dart';
import 'package:my_first_real_app/utils/db.dart';
import 'package:my_first_real_app/pages/players_page.dart';

class TeamsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener los nombres de los equipos desde la db
    final teamNames = TeamNamesFromDatabase();

    return Scaffold(
      appBar: AppBar(
        title: Text('Equipos'),
      ),
      body: ListView.builder(
        itemCount: teamNames.length,
        itemBuilder: (context, index) {
          final teamName = teamNames[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              ),
              title: Text(teamName),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayersPage(teamName: teamName),
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