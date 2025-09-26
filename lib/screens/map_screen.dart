// Importaciones necesarias para el widget.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// [MapScreen] es un widget sin estado que muestra la pantalla del mapa.
///
/// Al ser un `StatelessWidget`, su contenido es estático. Es ideal para mostrar
/// información que no cambia, como un mapa con marcadores fijos.
class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra de la aplicación con un título y un botón de acción.
      appBar: AppBar(
        title: const Text('Puntos de Reciclaje'),
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
      // Cuerpo de la pantalla, con un texto centrado que actúa como marcador de posición.
      body: const Center(
        child: Text(
          'Aquí se mostrará un mapa con los puntos de reciclaje.',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
