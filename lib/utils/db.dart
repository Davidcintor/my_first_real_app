import 'package:http/http.dart' as http;
import 'dart:convert';

// Variable global para almacenar el tipo de usuario actual
String userType = '';

// Variable global que contiene los datos de los usuarios y sus roles
final Map<String, String> usersData = {
  'test@example.com': 'admin',
  'capitan@example.com': 'capitan',
  'jugador@example.com': 'jugador',
};

// Función para obtener los equipos desde la API
Future<List<Map<String, String>>> TeamsFromAPI() async {
  final response = await http.get(Uri.parse('https://dev-lemc.onrender.com/equipos'));

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data.map((team) {
      return {
        'IdEquipo': team['IdEquipo']?.toString() ?? 'Unknown',
        'NombreEquipo': team['NombreEquipo']?.toString() ?? 'Unknown',
      };
    }).toList();
  } else {
    throw Exception('Failed to load teams');
  }
}

// Simular la obtención de jugadores para un equipo desde la db
Map<String, List<Map<String, String>>> PlayersFromDatabase() {
  return {
    'Jicalán Esports': [
      {
        'id': 'XBOX123',
        'name': 'Carlos Hernández',
        'dob': '1990-01-01',
        'facebook': 'carlos.hernandez',
        'instagram': 'carlos_hernandez',
        'youtube': 'carloshernandez',
        'twitch': 'carlos_hernandez',
      },
      {
        'id': 'PLAY456',
        'name': 'Luis García',
        'dob': '1991-02-02',
        'facebook': 'luis.garcia',
        'instagram': 'luis_garcia',
        'youtube': 'luisgarcia',
        'twitch': 'luis_garcia',
      },
      // Más jugadores...
    ],
    'Santos Grifos FC': [
      {
        'id': 'PC789',
        'name': 'Juan Pérez',
        'dob': '1992-03-03',
        'facebook': 'juan.perez',
        'instagram': 'juan_perez',
        'youtube': 'juanperez',
        'twitch': 'juan_perez',
      },
      {
        'id': 'XBOX101',
        'name': 'Miguel Sánchez',
        'dob': '1993-04-04',
        'facebook': 'miguel.sanchez',
        'instagram': 'miguel_sanchez',
        'youtube': 'miguelsanchez',
        'twitch': 'miguel_sanchez',
      },
      // Más jugadores...
    ],
    'JOGO COIT DRK': [
      {
        'id': 'PLAY202',
        'name': 'José Martínez',
        'dob': '1994-05-05',
        'facebook': 'jose.martinez',
        'instagram': 'jose_martinez',
        'youtube': 'josemartinez',
        'twitch': 'jose_martinez',
      },
      {
        'id': 'PC303',
        'name': 'Fernando López',
        'dob': '1995-06-06',
        'facebook': 'fernando.lopez',
        'instagram': 'fernando_lopez',
        'youtube': 'fernandolopez',
        'twitch': 'fernando_lopez',
      },
      // Más jugadores...
    ],
    // Más equipos...
  };
}