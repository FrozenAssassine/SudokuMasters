import 'package:flutter/material.dart';

class SudokuSolvedDialog extends StatelessWidget {
  const SudokuSolvedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "🎉 You Won! 🎉",
            style: TextStyle(fontSize: 40),
          ),
          Padding(padding: EdgeInsets.all(10.0)),
          const Text(
            'Ready for another challenge?',
            style: TextStyle(fontSize: 22),
          ),
          Padding(padding: EdgeInsets.all(10.0)),
          TextButton(
              onPressed: () {
                //play again
              },
              child: Text("Play Again", style: TextStyle(fontSize: 22))),
        ],
      ),
    );
  }
}
