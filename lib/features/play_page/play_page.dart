import 'package:flutter/material.dart';
import 'package:sudoku_masters/features/backend/generator.dart';
import 'package:sudoku_masters/features/backend/sudoku.dart';
import 'package:sudoku_masters/features/sudoku_grid/sudoku_grid.dart';
import 'package:sudoku_masters/features/sudoku_keyboard/sudoku_keyboard.dart';

class PlayPage extends StatelessWidget {
  PlayPage({super.key});
  Sudoku sudoku = SudokuGenerator().generate();
  // UI update here (sudoku.get)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: SudokuGrid(sudoku),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: SudokuKeyboard(
                onIndexChanged: (index) {
                  print('Keyboard index: $index');
                  if(sudoku.isActive){
                    sudoku.set(sudoku.currentP.x, sudoku.currentP.y, index);
                    sudoku.isActive = false;
                    // UI update here
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
