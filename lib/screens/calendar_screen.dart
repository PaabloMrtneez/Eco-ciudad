import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendario de Recolección'),
        actions: [
          IconButton(
            icon: const Icon(Icons.screen_rotation),
            onPressed: () {
              final currentOrientation = MediaQuery.of(context).orientation;
              if (currentOrientation == Orientation.portrait) {
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
