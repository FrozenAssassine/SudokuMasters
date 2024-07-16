import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sudoku_masters/features/backend/point.dart';
import 'package:sudoku_masters/features/backend/sudoku.dart';

class SudokuGridItem extends StatefulWidget {
  final int gridCellIndex;
  final Sudoku? sudoku;

  const SudokuGridItem(this.sudoku, this.gridCellIndex);

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
      padding: const EdgeInsets.all(2),
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
                      Point p = _getCoords(index);
                      widget.sudoku?.currentP = p;
                      if (widget.sudoku?.original?.isFree(p.x, p.y) ?? false) {
                        widget.sudoku?.setActive(true);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(.5),
                      color: Colors.blueAccent,
                      child: Center(
                        child: AutoSizeText(
                          '${widget.sudoku?.getP(_getCoords(index)).toString().replaceAll("-1", "")}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 60),
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
