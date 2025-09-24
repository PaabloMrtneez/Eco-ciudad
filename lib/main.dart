import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eco-Ciudad',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
            _buildNavigationButton(
              context,
              'Calendario de recolección',
              () {},
            ),
            const SizedBox(height: 20),
            _buildNavigationButton(
              context,
              'Puntos de Reciclaje',
              () {},
            ),
            const SizedBox(height: 20),
            _buildNavigationButton(
              context,
              'Mis Estadísticas',
              () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButton(
      BuildContext context, String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(300, 60), 
        textStyle: const TextStyle(fontSize: 20),
      ),
      child: Text(text),
    );
  }
}
