import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku_masters/features/backend/generator.dart';
import 'package:sudoku_masters/features/play_page/play_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SudokuGenerator().generate(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: PlayPage(),
      ),
    );
  }
}
