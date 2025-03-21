import 'package:flutter/material.dart';
import 'package:my_first_real_app/pages/home_page.dart';
import 'package:my_first_real_app/pages/login_page.dart';
import 'package:my_first_real_app/pages/splash_screen.dart';
import 'package:my_first_real_app/pages/teams_page.dart';
import 'package:my_first_real_app/pages/players_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo test in mac',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/teams': (context) => TeamsPage(),
      },
    );
  }
}