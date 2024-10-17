import 'package:flutter/material.dart';
import 'package:tintin/screens/albums_master.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
      home: const AlbumsMaster(title: "Albums")
    );
  }
}
