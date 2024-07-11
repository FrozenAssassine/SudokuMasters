import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku_masters/features/backend/sudoku.dart';
// import 'package:sudoku_masters/features/backend/sudoku.dart';
import 'package:sudoku_masters/features/sudoku_grid/sudoku_grid.dart';
import 'package:sudoku_masters/features/sudoku_keyboard/sudoku_keyboard.dart';

class PlayPage extends StatelessWidget {
  PlayPage({super.key});
  Sudoku sudoku = Sudoku();

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
                  Sudoku sudoku = Provider.of<Sudoku>(context, listen: false);
                  sudoku.set(sudoku.currentP.x, sudoku.currentP.y, index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
