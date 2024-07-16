import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku_masters/dialogs/sudoku_solved_dialog/sudoku_solved_dialog.dart';
import 'package:sudoku_masters/features/backend/generator.dart';
import 'package:sudoku_masters/features/backend/sudoku.dart';
import 'package:sudoku_masters/features/sudoku_grid/sudoku_grid.dart';
import 'package:sudoku_masters/features/sudoku_keyboard/sudoku_keyboard.dart';

class PlayPage extends StatelessWidget {
  final Difficulty difficulty;
  final Sudoku sudoku;

  PlayPage({
    super.key,
    required this.difficulty,
  }) : sudoku = SudokuGenerator().generate(Difficulty.Easy);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 28.0,
                    semanticLabel: 'Go back',
                  ),
                ),
              )),
          Expanded(
            flex: 7,
            child: LayoutBuilder(
              builder: (context, constraints) {
                double gridSize = constraints.maxWidth < constraints.maxHeight
                    ? constraints.maxWidth
                    : constraints.maxHeight;
                return Center(
                  child: SizedBox(
                    width: gridSize,
                    height: gridSize,
                    child: Consumer<Sudoku>(
                      builder: (context, sudoku, child) {
                        return SudokuGrid(sudoku);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: SudokuKeyboard(
                onIndexChanged: (index) {
                  final sudoku = Provider.of<Sudoku>(context, listen: false);
                  if (sudoku.isActive) {
                    Sudoku sudoku = Provider.of<Sudoku>(context, listen: false);
                    sudoku.set(sudoku.currentP.x, sudoku.currentP.y, index);
                    sudoku.setActive(false);
                    if (sudoku.isValidSolved()) {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => const Dialog(
                                child: SudokuSolvedDialog(),
                              ));
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
