import 'package:flutter/material.dart';

class SudokuGridItem extends StatefulWidget {
  final int gridCellIndex;

  SudokuGridItem(this.gridCellIndex);

  @override
  State<SudokuGridItem> createState() => _SudokuGridItemState();
}

class _SudokuGridItemState extends State<SudokuGridItem> {
  @override
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
                  child: GestureDetector(
                    onTap: () {
                      print('Cell ${widget.gridCellIndex}, ${index} tapped');
                      // You can add more logic here to handle the tap event
                    },
                    child: Container(
                      margin: EdgeInsets.all(4.0),
                      color: Colors.blueAccent,
                      child: Center(
                        child: Text(
                          'Index: $index',
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
