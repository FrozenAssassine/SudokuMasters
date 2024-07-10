import 'package:flutter/material.dart';
import 'package:sudoku_masters/features/sudoku_grid_item/sudoku_grid_item.dart';

class SudokuGrid extends StatefulWidget {
  SudokuGrid({super.key});

  @override
  _SudokuGridState createState() => _SudokuGridState();
}

class _SudokuGridState extends State<SudokuGrid> {
  void _test() {
    print('PRESSED');
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (row) {
          return Expanded(
            child: Row(
              children: List.generate(3, (col) {
                int index = row * 3 + col;
                return Expanded(
                  child: Container(
                    margin: EdgeInsets.all(4.0),
                    color: Colors.green,
                    child: Center(child: SudokuGridItem(index)),
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
