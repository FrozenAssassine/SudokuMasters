import 'package:flutter/material.dart';
import 'package:sudoku_masters/features/backend/sudoku.dart';
import 'package:sudoku_masters/features/sudoku_grid_item/sudoku_grid_item.dart';

class SudokuGrid extends StatefulWidget {
  final Sudoku? sudoku;
  SudokuGrid(this.sudoku, {super.key});

  @override
  _SudokuGridState createState() => _SudokuGridState();
}

class _SudokuGridState extends State<SudokuGrid> {
  void _test() {
    print('PRESSED');
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (row) {
          return Expanded(
            child: Row(
              children: List.generate(3, (col) {
                int index = row * 3 + col;
                return Expanded(
                  child: Container(
                    margin: EdgeInsets.all(0),
                    color: Colors.black,
                    child: Center(child: SudokuGridItem(widget.sudoku, index)),
                  ),
                );
              }),
            ),
          );
        }),
      ),
    );
  }
}
