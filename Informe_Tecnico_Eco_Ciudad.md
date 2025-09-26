# Informe Técnico: Aplicación Eco-Ciudad

*Pablo Martínez, Adrián Tamargo, Adrián Francino, & Álvaro Hernández*


## Introducción

Eco-Ciudad es una aplicación móvil desarrollada en Flutter, diseñada para servir como una herramienta integral para ciudadanos que desean adoptar un estilo de vida más sostenible.

Los objetivos del Proyecto son: 

Recordar los días de recolección de basura y reciclaje.
Encontrar puntos de reciclaje cercanos.
Llevar un registro básico de su actividad de reciclaje.

## Diseño de la UI/UX

El diseño de la interfaz de usuario (UI) y la experiencia de usuario (UX) se centraron en la simplicidad y la claridad, con el fin de garantizar una navegación intuitiva para un público amplio hemos escogido el color verde al tener una fuerte relacion con la naturaleza y el medio ambiente.

### Capturas
<img width="436" height="719" alt="image" src="https://github.com/user-attachments/assets/fbff96d7-8e5b-43e9-8fb5-6b82dc3950ba" /> 
<img width="455" height="681" alt="image" src="https://github.com/user-attachments/assets/874b8833-e493-481f-982b-ed9cee5aff9a" />
<img width="440" height="722" alt="image" src="https://github.com/user-attachments/assets/c6f9a72a-6e95-4cfa-8b21-3ffa91150957" />
<img width="429" height="718" alt="image" src="https://github.com/user-attachments/assets/64159ca3-66b6-4e5b-a0fd-5d67510e0dfc" /> 



### Composición del Layout

Para la pantalla principal, se optó por un diseño vertical simple utilizando un widget `Column` dentro de un `Center`. Esta estructura es ideal para presentar un menú de opciones claras y directas, ya que organiza los botones de navegación (`AnimatedButton`) uno debajo del otro, guiando al usuario de forma natural a través de las acciones principales disponibles. 

### Navegación Intuitiva

La navegación se diseñó para ser predecible y coherente con los patrones de diseño móvil establecidos. Desde la pantalla de inicio, cada botón lleva a una sección específica de la aplicación. Este flujo de navegación directo minimiza la carga cognitiva del usuario, permitiéndole acceder a la funcionalidad deseada con un solo toque. La transición entre pantallas utiliza `MaterialPageRoute`, que proporciona animaciones estándar de la plataforma, reforzando la sensación de familiaridad y profesionalismo en la aplicación.

### Navegación entre Pantallas

Flutter gestiona la navegación mediante un widget `Navigator` que administra una pila de `Routes`


```dart
// Navegación desde la pantalla principal a la pantalla del calendario.
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const CalendarScreen()),
);
```

Al presionar un botón, se crea una nueva `MaterialPageRoute` y se "empuja" (`push`) a la pila del navegador. Esto muestra la nueva pantalla y añade automáticamente un botón de "atrás" en el `AppBar`, permitiendo al usuario volver a la pantalla anterior de forma intuitiva (`pop`).

### Gestión del Ciclo de Vida y Persistencia de Estado

Uno de los desafíos técnicos fue la pérdida del estado del contador en la pantalla de estadísticas al rotar el dispositivo. Esto ocurre porque el framework destruye y reconstruye el árbol de widgets, perdiendo el estado local de los `StatefulWidgets`.

Usamos una funcion exclusiva de Flutter llamada `RestorationMixin` y se implementó de la siguiente manera:

1.  **Uso de `RestorationMixin`**: La clase de estado `_StatsScreenState` se extendió con `with RestorationMixin`.
2.  **Estado Restaurable**: La variable del contador se declaró como un `RestorableInt` en lugar de un `int` simple.
3.  **Registro para Restauración**: Dentro del método `restoreState`, se registró la variable del contador para que el framework se encargue de guardarla y restaurarla automáticamente.

```dart
class _StatsScreenState extends State<StatsScreen> with RestorationMixin {
  final RestorableInt _recycleCount = RestorableInt(0);

  @override
  String? get restorationId => 'stats_screen';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_recycleCount, 'recycle_count');
```

Esta solución garantiza que el estado persista a través de interrupciones del sistema, como cambios de orientación, sin necesidad de una gestión manual compleja.

## Proceso de Pruebas

Para asegurar la calidad y el correcto funcionamiento de la aplicación, se utilizó el registro de eventos y la depuración integrada. En lugar de Logcat  se empleó la biblioteca `dart:developer`, que proporciona una herramienta de registro estructurada y agnóstica a la plataforma.

Por ejemplo al rotar el dispositivo, la consola de depuración mostró el siguiente flujo de eventos, permitiendo verificar que el estado se estaba gestionando correctamente:

```
[StatsScreenLifecycle] deactivate called
[StatsScreenLifecycle] dispose called
[StatsScreenLifecycle] initState called
[StatsScreenLifecycle] restoreState called
[StatsScreenLifecycle] build called
```
Tambien funciona cuando hacemos click en el boton de añadir basura.

Este fragmento de registro enseña cómo el estado del widget es destruido (`dispose`) y recreado (`initState`, `restoreState`, `build`) durante una rotación.

Tambien funciona cuando hacemos click en el boton de añadir basura llevando un conteo en la consola de los clicks dados.

## Conclusión

El desarrollo de la aplicación Eco-Ciudad ha servido para aplicar conceptos fundamentales de la creación de aplicaciones móviles con Flutter. El principal desafío fue abstraerse de los patrones de desarrollo nativo de Android para adoptar el modelo declarativo y basado en widgets de Flutter. La implementación de una navegación robusta, la gestión efectiva del ciclo de vida y el estado, y un proceso de pruebas metódico han sido cruciales para construir una aplicación funcional y estable.

Como aprendizaje clave, destaca la importancia de comprender y utilizar las herramientas que el propio framework proporciona, como `RestorationMixin` para la persistencia del estado, en lugar de intentar replicar mecánicas de otras plataformas. Las técnicas de depuración y registro no solo ayudaron a resolver problemas específicos, sino que también proporcionaron una comprensión más profunda del funcionamiento interno del framework de Flutter.

## Referencias

https://docs.flutter.dev/cookbook/persistence/restoration

https://docs.flutter.dev/ui/navigation

https://docs.flutter.dev/ui#what-are-widgets
