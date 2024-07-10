import 'package:flutter/material.dart';
import 'package:sudoku_masters/features/play_page/play_page.dart';
import 'package:sudoku_masters/features/sudoku_grid/sudoku_grid.dart';

void main() {
  runApp(const MainApp());
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
