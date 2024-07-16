import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef IndexCallback = void Function(int index);

class SudokuKeyboard extends StatelessWidget {
  final IndexCallback onIndexChanged;

  SudokuKeyboard({required this.onIndexChanged});

  @override
  Widget build(BuildContext context) {
    double buttonSize = clampDouble(
        min(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height) /
            15,
        60,
        90);

    return Wrap(
        runSpacing: 15,
        spacing: 15,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: List.generate(
          9,
          (row) {
            return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(buttonSize, buttonSize),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                onPressed: () {
                  onIndexChanged(row + 1);
                },
                child: AutoSizeText(
                  '${row + 1}',
                  style: TextStyle(
                      fontSize: clampDouble(
                          min(MediaQuery.of(context).size.width,
                                  MediaQuery.of(context).size.height) /
                              25,
                          25,
                          45)),
                ));
          },
        ));
  }
}
