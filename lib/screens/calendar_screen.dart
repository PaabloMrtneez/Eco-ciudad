// Importaciones necesarias para el widget.
import 'package:flutter/material.dart';

/// [CalendarScreen] es un widget sin estado que muestra la pantalla del calendario.
///
/// Al ser un `StatelessWidget`, su contenido es estático y no cambia con el tiempo
/// o en respuesta a las interacciones del usuario. Es ideal para mostrar información fija.
class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra de la aplicación con un título.
      appBar: AppBar(
        title: const Text('Calendario de Recolección'),
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
