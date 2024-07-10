import 'package:flutter/material.dart';
import 'package:sudoku_masters/features/sudoku_grid/sudoku_grid.dart';

class PlayPage extends StatelessWidget {
  const PlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(color: Colors.blue, child: SudokuGrid()),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.green,
              child: const Center(
                child: Text(
                  '20%',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
