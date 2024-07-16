import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku_masters/features/backend/generator.dart';
import 'package:sudoku_masters/features/home_page/difficutly_item/difficulty_item.dart';
import 'package:sudoku_masters/features/play_page/play_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _navigateToPlayPage(BuildContext context, Difficulty difficulty) {
    print("Button Pressed");
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => SudokuGenerator().generate(difficulty),
          child: PlayPage(difficulty: difficulty),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sudoku Masters",
              style: TextStyle(fontSize: 42),
            ),
            const Text(
              "Levels:",
              style: TextStyle(fontSize: 24),
            ),
            Wrap(
              children: [
                DifficultyItem(
                  onPressed: () {
                    _navigateToPlayPage(context, Difficulty.Easy);
                  },
                  headline: "🟢 Easy",
                  subheadline: "Perfect for Beginners",
                  description:
                      "Take your time and enjoy a relaxing game of Sudoku. This level is designed for those new to the game or looking for a casual challenge.",
                ),
                DifficultyItem(
                  onPressed: () {
                    _navigateToPlayPage(context, Difficulty.Easy);
                  },
                  headline: "🟡 Medium",
                  subheadline: "A Balanced Challenge",
                  description:
                      "Ready to step up your game? The Medium level offers a satisfying challenge for those who are familiar with Sudoku but want a bit more difficulty.",
                ),
                DifficultyItem(
                  onPressed: () {
                    _navigateToPlayPage(context, Difficulty.Hard);
                  },
                  headline: "🔴 Hard",
                  subheadline: "For the Sudoku Masters",
                  description:
                      "Think you have what it takes? The Hard level is designed for experienced players looking for a serious challenge. Test your skills and push your limits.",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
