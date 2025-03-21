import 'package:flutter/material.dart';
import 'package:my_first_real_app/pages/home_page.dart';
import 'package:my_first_real_app/pages/login_page.dart';
import 'package:my_first_real_app/pages/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_first_real_app/utils/db.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<void> _getUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userType = prefs.getString('userType') ?? 'jugador';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _getUserType(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('Error: ${snapshot.error}'),
              ),
            ),
          );
        } else {
          return MaterialApp(
            title: 'Flutter Demo test in mac',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: SplashScreen(),
            routes: {
              '/login': (context) => LoginPage(),
              '/home': (context) => HomePage(),
            },
          );
        }
      },
    );
  }
}