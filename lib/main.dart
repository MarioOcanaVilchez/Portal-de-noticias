import 'package:flutter/material.dart';
import 'package:portal_noticias/screens/homescreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 0, 195, 255)),),
      home: HomeScreen(),
    );
  }
}
