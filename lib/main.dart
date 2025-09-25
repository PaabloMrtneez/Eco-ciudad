// Importaciones necesarias para la aplicación.
import 'package:flutter/material.dart';
import 'package:myapp/screens/calendar_screen.dart';
import 'package:myapp/screens/map_screen.dart';
import 'package:myapp/screens/stats_screen.dart';
import 'package:myapp/widgets/animated_button.dart';

/// El punto de entrada principal de la aplicación.
void main() {
  runApp(const MyApp());
}

/// El widget raíz de la aplicación.
///
/// Este widget configura el tema general y la navegación inicial de la aplicación.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eco-Ciudad',
      // ID de restauración para la gestión del estado de la aplicación.
      restorationScopeId: 'app',
      // Oculta el banner de depuración en la esquina superior derecha.
      debugShowCheckedModeBanner: false,
      // Define el tema visual de la aplicación.
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green[800], // Color de fondo coherente.
          foregroundColor: Colors.white, // Color para iconos y texto.
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20, // Tamaño del título del AppBar.
            fontWeight: FontWeight.bold, // Título en negrita.
          ),
          iconTheme: const IconThemeData(
            color: Colors.white, // Asegura que todos los iconos sean blancos.
          ),
        ),
      ),
      // La pantalla de inicio de la aplicación.
      home: const MyHomePage(),
    );
  }
}

/// La pantalla principal que se muestra al iniciar la aplicación.
///
/// Contiene los botones de navegación a las diferentes secciones de la aplicación.
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
              // Icono principal de la aplicación.
              const Icon(
                Icons.eco,
                size: 150,
                color: Colors.white,
              ),
              const SizedBox(height: 20),
              // Título de bienvenida.
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
              // Botón para navegar a la pantalla del calendario.
              AnimatedButton(
                title: 'Calendario de recolección',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CalendarScreen()),
                  );
                },
                buttonKey: const Key('btnCalendar'),
              ),
              const SizedBox(height: 20),
              // Botón para navegar a la pantalla del mapa.
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
              // Botón para navegar a la pantalla de estadísticas.
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
