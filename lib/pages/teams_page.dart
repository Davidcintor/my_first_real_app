import 'package:flutter/material.dart';
import 'package:my_first_real_app/utils/db.dart';
import 'package:my_first_real_app/pages/players_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeamsPage extends StatefulWidget {
  @override
  _TeamsPageState createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  @override
  void initState() {
    super.initState();
    _loadUserType();
  }

  Future<void> _loadUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userType = prefs.getString('userType') ?? 'jugador';
    });
  }

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
                    builder: (context) => PlayersPage(teamName: teamName, userType: userType),
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