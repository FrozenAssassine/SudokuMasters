import 'package:flutter/material.dart';
import 'package:sudoku_masters/features/sudoku_grid/sudoku_grid.dart';
import 'package:sudoku_masters/features/sudoku_keyboard/sudoku_keyboard.dart';

class PlayPage extends StatelessWidget {
  const PlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: SudokuGrid(),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: SudokuKeyboard(
                onIndexChanged: (index) {
                  print('Keyboard index: $index');
                  // Handle the index as needed
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
