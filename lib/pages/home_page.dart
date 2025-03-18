import 'package:flutter/material.dart';
import 'package:my_first_real_app/pages/statistics_page.dart';
import 'package:my_first_real_app/pages/teams_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/bottom_navigation_bar.dart';
import 'calendar_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static  List<Widget> _widgetOptions = <Widget>[
    WelcomeWidget(),
    CalendarPage(),
    StatisticsPage(),
    TeamsPage(),
    UserPage(),
  ];

  static const List<String> _titles = <String>[
    'Inicio',
    'Calendario',
    'Estadísticas',
    'Equipos',
    'Usuario',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(100.0),
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(202, 190, 123, 60),
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4.0,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: const Text(
            '¡Bienvenido a la aplicación!',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => _logout(context),
        child: Text('Logout'),
      ),
    );
  }
}