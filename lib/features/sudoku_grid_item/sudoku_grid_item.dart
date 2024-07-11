import 'package:flutter/material.dart';
import 'package:sudoku_masters/features/backend/point.dart';
import 'package:sudoku_masters/features/backend/sudoku.dart';

class SudokuGridItem extends StatefulWidget {
  final int gridCellIndex;
  final Sudoku? sudoku;

  SudokuGridItem(this.sudoku, this.gridCellIndex);

  @override
  State<SudokuGridItem> createState() => _SudokuGridItemState();
}

class _SudokuGridItemState extends State<SudokuGridItem> {
  Point _getCoords(int index) {
    return Point(
        (widget.gridCellIndex % 3) * 3 + (index % 3),
        (widget.gridCellIndex -
                (widget.gridCellIndex % 3) +
                ((index - (index % 3)) / 3))
            .round());
  }

  @override
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
                  child: GestureDetector(
                    onTap: () {
                      print('Cell ${widget.gridCellIndex}, ${index} tapped');
                      print(
                          'X: ${(widget.gridCellIndex % 3) * 3 + (index % 3)}, Y: ${(widget.gridCellIndex - (widget.gridCellIndex % 3) + ((index - (index % 3)) / 3)).round()}');
                      widget.sudoku?.currentP = _getCoords(index);
                      widget.sudoku?.isActive = true;
                    },
                    child: Container(
                      margin: EdgeInsets.all(2),
                      color: Colors.blueAccent,
                      child: Center(
                        child: Text(
                          '${widget.sudoku?.getP(_getCoords(index)).toString().replaceAll("-1", "")}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
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
