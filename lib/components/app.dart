import 'package:flutter/material.dart';

import 'home/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const MaterialColor color = const MaterialColor(
      0xFFE1647B,
      const <int, Color>{
        50: const Color(0xFFfbecef),
        100: const Color(0xFFf6d1d7),
        200: const Color(0xFFf0b2bd),
        300: const Color(0xFFea93a3),
        400: const Color(0xFFe67b8f),
        500: const Color(0xFFe1647b),
        600: const Color(0xFFdd5c73),
        700: const Color(0xFFd95268),
        800: const Color(0xFFd5485e),
        900: const Color(0xFFcd364b),
      },
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: color,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Home(),
    );
  }
}
