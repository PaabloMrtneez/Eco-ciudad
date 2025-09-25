import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:developer' as developer;

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> with RestorationMixin {
  final RestorableInt _recycleCount = RestorableInt(0);

  @override
  void initState() {
    super.initState();
    developer.log('initState called', name: 'StatsScreenLifecycle');
  }

  void _incrementRecycleCount() {
    developer.log('Valor del contador antes de incrementar: ${_recycleCount.value}', name: 'StatsScreen');
    setState(() {
      _recycleCount.value++;
    });
    developer.log('Valor del contador después de incrementar: ${_recycleCount.value}', name: 'StatsScreen');
  }

  @override
  String? get restorationId => 'stats_screen';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    developer.log('restoreState called', name: 'StatsScreenLifecycle');
    registerForRestoration(_recycleCount, 'recycle_count');
  }

  @override
  void deactivate() {
    developer.log('deactivate called', name: 'StatsScreenLifecycle');
    super.deactivate();
  }

  @override
  void dispose() {
    developer.log('dispose called', name: 'StatsScreenLifecycle');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    developer.log('build called', name: 'StatsScreenLifecycle');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Estadísticas'),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bolsas recicladas este mes: ${_recycleCount.value}',
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _incrementRecycleCount,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[800],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('+1 Bolsa Reciclada'),
            ),
          ],
        ),
      ),
    );
  }
}
