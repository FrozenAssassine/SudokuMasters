import 'package:flutter/material.dart';

class SudokuGrid extends StatefulWidget {
  const SudokuGrid({super.key});

  @override
  _SudokuGridState createState() => _SudokuGridState();
}

class _SudokuGridState extends State<SudokuGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sudoku Grid'),
      ),
      body: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 9, // 9 columns for a Sudoku grid
          ),
          itemCount: 81, // 9x9 grid, so 81 cells
          itemBuilder: (context, index) {
            return GridTile(
              child: GestureDetector(
                onTap: () {
                  // Handle cell tap
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: const Center(
                    child: Text(
                      '', // Display the number here if you have one
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
