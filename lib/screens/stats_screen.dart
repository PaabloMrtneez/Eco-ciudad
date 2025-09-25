// Importaciones necesarias para el widget.
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

/// [StatsScreen] es un widget con estado que muestra las estadísticas de reciclaje del usuario.
///
/// Utiliza un `StatefulWidget` porque su contenido cambia en respuesta a las interacciones del usuario
/// (por ejemplo, al presionar el botón para incrementar el contador).
class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

/// [_StatsScreenState] es la clase de estado para [StatsScreen].
///
/// Utiliza [RestorationMixin] para guardar y restaurar el estado del contador a través de
/// reinicios de la aplicación o cambios de configuración (como la rotación de pantalla).
class _StatsScreenState extends State<StatsScreen> with RestorationMixin {
  /// [_recycleCount] es un entero "restaurable" que almacena el número de bolsas recicladas.
  /// Su valor se guardará y restaurará automáticamente gracias al [RestorationMixin].
  final RestorableInt _recycleCount = RestorableInt(0);

  /// El ID de restauración único para este widget.
  /// Es necesario para que el framework sepa qué datos restaurar.
  @override
  String? get restorationId => 'stats_screen';

  @override
  void initState() {
    super.initState();
    // Registra un mensaje en la consola de depuración cuando el estado se inicializa por primera vez.
    developer.log('initState called', name: 'StatsScreenLifecycle');
  }

  /// Este método se llama para registrar las propiedades que necesitan ser restauradas.
  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    developer.log('restoreState called', name: 'StatsScreenLifecycle');
    // Registra `_recycleCount` para la restauración. El framework se encargará de
    // guardar su valor cuando sea necesario y proporcionarlo de nuevo aquí.
    registerForRestoration(_recycleCount, 'recycle_count');
  }

  /// Incrementa el contador de bolsas recicladas y actualiza la interfaz de usuario.
  void _incrementRecycleCount() {
    // Registra el valor antes del incremento para depuración.
    developer.log('Valor del contador antes de incrementar: ${_recycleCount.value}', name: 'StatsScreen');
    // `setState` notifica al framework que el estado ha cambiado, lo que provoca
    // que el método `build` se vuelva a ejecutar y la UI se actualice.
    setState(() {
      _recycleCount.value++;
    });
    // Registra el valor después del incremento para depuración.
    developer.log('Valor del contador después de incrementar: ${_recycleCount.value}', name: 'StatsScreen');
  }

  @override
  void deactivate() {
    // Registra un mensaje cuando el widget es retirado del árbol de widgets temporalmente.
    developer.log('deactivate called', name: 'StatsScreenLifecycle');
    super.deactivate();
  }

  @override
  void dispose() {
    // Registra un mensaje cuando el objeto de estado se elimina permanentemente.
    developer.log('dispose called', name: 'StatsScreenLifecycle');
    // Es importante liberar recursos aquí, como `_recycleCount`.
    _recycleCount.dispose();
    super.dispose();
  }

  /// El método `build` se ejecuta cada vez que el estado cambia (debido a `setState`)
  /// o cuando el widget necesita ser redibujado por otras razones.
  @override
  Widget build(BuildContext context) {
    developer.log('build called', name: 'StatsScreenLifecycle');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Estadísticas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Muestra el número actual de bolsas recicladas.
            Text(
              'Bolsas recicladas este mes: ${_recycleCount.value}',
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Un botón que, al ser presionado, llama a `_incrementRecycleCount`.
            ElevatedButton(
              onPressed: _incrementRecycleCount,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[800],
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
