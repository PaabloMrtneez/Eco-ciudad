// Importaciones necesarias para el widget.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// [CalendarScreen] es un widget sin estado que muestra la pantalla del calendario.
///
/// Al ser un `StatelessWidget`, su contenido es estático y no cambia con el tiempo
/// o en respuesta a las interacciones del usuario. Es ideal para mostrar información fija.
class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra de la aplicación con un título y un botón de acción.
      appBar: AppBar(
        title: const Text('Calendario de Recolección'),
        actions: [
          IconButton(
            icon: const Icon(Icons.screen_rotation),
            onPressed: () {
              final orientation = MediaQuery.of(context).orientation;
              if (orientation == Orientation.portrait) {
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.landscapeLeft,
                  DeviceOrientation.landscapeRight,
                ]);
              } else {
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitUp,
                  DeviceOrientation.portraitDown,
                ]);
              }
            },
          ),
        ],
      ),
      // Cuerpo de la pantalla, centrado y con un texto de marcador de posición.
      body: const Center(
        child: Text(
          'Aquí se mostrará el calendario de recolección.',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
