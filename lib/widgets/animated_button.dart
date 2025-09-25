import 'package:flutter/material.dart';

/// [AnimatedButton] es un widget de botón reutilizable con una animación de escala al pasar el ratón por encima.
///
/// Es un `StatefulWidget` porque gestiona su propia `AnimationController` para controlar la animación.
class AnimatedButton extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;
  final Key? buttonKey;

  const AnimatedButton({
    required this.title,
    required this.onPressed,
    this.buttonKey,
  }) : super(key: buttonKey);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

/// La clase de estado para [AnimatedButton].
///
/// Utiliza `SingleTickerProviderStateMixin` para proporcionar el `Ticker` necesario
/// para el `AnimationController`.
class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    // Inicializa el controlador de la animación.
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    // Define la animación de escala, que va de 1.0 a 1.05.
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    // Libera los recursos del controlador para evitar fugas de memoria.
    _controller.dispose();
    super.dispose();
  }

  /// Se activa cuando el cursor del ratón entra o sale del área del botón.
  void _onHover(bool isHovering) {
    if (isHovering) {
      // Inicia la animación hacia adelante si el cursor está encima.
      _controller.forward();
    } else {
      // Invierte la animación si el cursor sale.
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color pastelGreen = Colors.green[200]!;

    // MouseRegion detecta cuándo el cursor entra o sale de su área.
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      cursor: SystemMouseCursors.click, // Cambia el cursor a una mano.
      // ScaleTransition aplica la animación de escala a su widget hijo.
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.green[800], // Texto verde oscuro para contraste.
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: pastelGreen, width: 2), // Borde verde pastel.
            ),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            elevation: 8, // Sombra para dar profundidad.
          ),
          child: Text(widget.title),
        ),
      ),
    );
  }
}
