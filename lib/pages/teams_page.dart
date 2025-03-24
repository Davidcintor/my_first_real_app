import 'package:flutter/material.dart';
import 'package:my_first_real_app/utils/db.dart';
import 'package:my_first_real_app/pages/players_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeamsPage extends StatefulWidget {
  @override
  _TeamsPageState createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  List<Map<String, String>> teams = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadUserType();
    _fetchTeams();
  }

  Future<void> _loadUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userType = prefs.getString('userType') ?? 'jugador';
    });
  }

  Future<void> _fetchTeams() async {
    try {
      final fetchedTeams = await TeamsFromAPI();
      setState(() {
        teams = fetchedTeams;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Failed to load teams: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : ListView.builder(
                  itemCount: teams.length,
                  itemBuilder: (context, index) {
                    final team = teams[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage('https://dev-lemc.onrender.com/images'), // Aquí puedes usar la URL real del escudo
                        ),
                        title: Text(team['NombreEquipo']!),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlayersPage(teamName: team['NombreEquipo']!, userType: userType),
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