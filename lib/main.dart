import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      title: 'Eco-Ciudad',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.patrickHandTextTheme(textTheme).copyWith(
          labelLarge: GoogleFonts.patrickHand(
            textStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(300, 60),
            textStyle: GoogleFonts.patrickHand(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            foregroundColor: Colors.black,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.eco,
              size: 150,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            Text(
              'Bienvenido a Eco-Ciudad',
              textAlign: TextAlign.center,
              style: GoogleFonts.patrickHand(
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
      child: Text(text),
    );
  }
}
