import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/screens/calendar_screen.dart';
import 'package:myapp/screens/map_screen.dart';
import 'package:myapp/screens/stats_screen.dart';
import 'package:myapp/widgets/animated_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eco-Ciudad',
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green[800], // Consistent background color
          foregroundColor: Colors.white, // Sets default color for icons and text
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20, // Default AppBar title size
            fontWeight: FontWeight.bold, // Make the title text thicker
          ),
          iconTheme: const IconThemeData(
            color: Colors.white, // Ensure all icons are white
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[700],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 40),
              const Icon(
                Icons.eco,
                size: 150,
                color: Colors.white,
              ),
              const SizedBox(height: 20),
              const Text(
                'Bienvenido a Eco-Ciudad',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              AnimatedButton(
                title: 'Calendario de recolección',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CalendarScreen()),
                  );
                },
                buttonKey: const Key('btnCalendar'),
              ),
              const SizedBox(height: 20),
              AnimatedButton(
                title: 'Puntos de Reciclaje',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MapScreen()),
                  );
                },
                buttonKey: const Key('btnMap'),
              ),
              const SizedBox(height: 20),
              AnimatedButton(
                title: 'Mis Estadísticas',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StatsScreen()),
                  );
                },
                buttonKey: const Key('btnStats'),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
