import 'package:flutter/material.dart';

typedef IndexCallback = void Function(int index);

class SudokuKeyboard extends StatelessWidget {
  final IndexCallback onIndexChanged;

  SudokuKeyboard({required this.onIndexChanged});

  @override
  Widget build(BuildContext context) {
    return Wrap(
        runSpacing: 15,
        spacing: 10,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: List.generate(
          9,
          (row) {
            return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(50, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                onPressed: () {
                  onIndexChanged(row + 1);
                },
                child: Text('${row + 1}'));
          },
        ));
  }
}
