// Simular la obtención de datos desde la db
List<String> TeamNamesFromDatabase() {
  return [
    'Jicalán Esports',
    'Santos Grifos FC',
    'JOGO COIT DRK',
    'Kings of the north',
    'Once 33',
    'Inmigración FC',
    'Royal Family',
    'Red Panthers',
    'LQRa FV',
    'Quetzalcoatl Esports',
    'Darketos FC',
    'Real Mexa',
    'Forasteros',
    'Wolf Gaming',
    'Gunners xFC',
    'Street Esports',
  ];
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