import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku_masters/features/backend/generator.dart';
import 'package:sudoku_masters/features/backend/sudoku.dart';
// import 'package:sudoku_masters/features/backend/sudoku.dart';
import 'package:sudoku_masters/features/sudoku_grid/sudoku_grid.dart';
import 'package:sudoku_masters/features/sudoku_keyboard/sudoku_keyboard.dart';

class PlayPage extends StatelessWidget {
  PlayPage({super.key});
  Sudoku sudoku = SudokuGenerator().generate();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 8,
              child: Consumer<Sudoku>(
                builder: (context, sudoku, child) {
                  return SudokuGrid(sudoku);
                },
              )),
          Expanded(
            flex: 2,
            child: Container(
              child: SudokuKeyboard(
                onIndexChanged: (index) {
                  if (sudoku.isActive) {
                    Sudoku sudoku = Provider.of<Sudoku>(context, listen: false);
                    print('Keyboard index: $index');
                    sudoku.set(sudoku.currentP.x, sudoku.currentP.y, index);
                    sudoku.isActive = false;
                    // UI update here
                    if (sudoku.isValidSolved()) {
                      // THE USER WINS
                    }
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
