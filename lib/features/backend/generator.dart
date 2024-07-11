import 'dart:math';

import 'sudoku.dart';
import 'point.dart';

enum Difficulty { Easy, Hard }

enum ExamineResult {
  MultipleSolutions,
  LogicalInferable,
  OneSolutionNotLogicalInferable
}

class SudokuGenerator {
  Difficulty difficulty = Difficulty.Easy;

  Sudoku generate() {
    Sudoku s = generateWithSeed(DateTime.now().millisecondsSinceEpoch);
    s.original = s.clone();
    return s;
  }

  Sudoku generateWithSeed(int seed) {
    Random r = Random(seed);
    Sudoku basePattern = generateValidBasePattern(r);

    List<Point> remaining = [];
    for (int x = 0; x < 9; x++) {
      for (int y = 0; y < 9; y++) {
        remaining.add(Point(x, y));
      }
    }

    return makeHarder(basePattern, r, remaining);
  }

  Sudoku makeHarder(Sudoku sudoku, Random r, List<Point> remaining) {
    int n = r.nextInt(remaining.length);
    Sudoku clone = sudoku.clone();
    clone[remaining[n]] = Sudoku.EMPTYSLOT;
    ExamineResult res = examine(clone.clone());
    remaining.removeAt(n);
    if (res == ExamineResult.MultipleSolutions ||
        (res == ExamineResult.OneSolutionNotLogicalInferable &&
            difficulty == Difficulty.Easy)) {
      if (remaining.isEmpty) return sudoku;
      return makeHarder(sudoku, r, remaining);
    }
    if (remaining.isEmpty) return clone;
    return makeHarder(clone, r, remaining);
  }

  Sudoku generateValidBasePattern(Random r) {
    Sudoku sudoku = generateRecursive(Sudoku(), r);
    while (!sudoku.isValidSolved()) sudoku = generateRecursive(Sudoku(), r);
    return sudoku;
  }

  Sudoku generateValidBasePatternWithSudoku(Sudoku sudoku, Random r) {
    Sudoku s = generateRecursive(sudoku.clone(), r);
    while (!s.isValidSolved()) s = generateRecursive(sudoku.clone(), r);
    return s;
  }

  Sudoku generateRecursive(Sudoku sudoku, Random r) {
    List<Map<String, dynamic>> possibilities = [];
    List<Point> free = sudoku.getFreePlaces();
    bool found;

    do {
      possibilities.clear();
      for (Point p in free) {
        possibilities.add({
          'x': p.x,
          'y': p.y,
          'possibleNums': getPossibleNumbers(sudoku, p.x, p.y)
        });
      }
      found = false;
      for (int i = 0; i < possibilities.length; i++) {
        if (possibilities[i]['possibleNums'].length == 1) {
          sudoku[Point(possibilities[i]['x'], possibilities[i]['y'])] =
              possibilities[i]['possibleNums'][0];
          free.removeAt(i);
          possibilities.removeAt(i);
          i--;
          found = true;
        }
      }
    } while (found);

    if (free.isEmpty) return sudoku;

    var possibility = possibilities[r.nextInt(possibilities.length)];
    if (possibility['possibleNums'].isEmpty) return sudoku;
    sudoku[Point(possibility['x'], possibility['y'])] =
        possibility['possibleNums']
            [r.nextInt(possibility['possibleNums'].length)];

    return generateRecursive(sudoku, r);
  }

  List<int> getPossibleNumbers(Sudoku sudoku, int x, int y) {
    List<int> nums = [];
    for (int i = 1; i < 10; i++) {
      if (sudoku.fitsNumber(x, y, i)) nums.add(i);
    }
    return nums;
  }

  ExamineResult examine(Sudoku original) {
    List<Map<String, dynamic>> possibilities = [];
    List<Point> free = original.getFreePlaces();
    bool found;

    do {
      possibilities.clear();
      for (Point p in free) {
        possibilities.add({
          'x': p.x,
          'y': p.y,
          'possibleNums': getPossibleNumbers(original, p.x, p.y)
        });
      }
      found = false;
      for (int i = 0; i < possibilities.length; i++) {
        if (possibilities[i]['possibleNums'].length == 1) {
          original[Point(possibilities[i]['x'], possibilities[i]['y'])] =
              possibilities[i]['possibleNums'][0];
          free.removeAt(i);
          possibilities.removeAt(i);
          i--;
          found = true;
        }
      }
    } while (found);

    if (free.isEmpty) return ExamineResult.LogicalInferable;

    List<Sudoku> possibleEndings = [];

    for (int i = 0; i < possibilities[0]['possibleNums'].length; i++) {
      Sudoku newTry = original.clone();
      newTry[Point(possibilities[0]['x'], possibilities[0]['y'])] =
          possibilities[0]['possibleNums'][i];
      ExamineResult res = examine(newTry);
      if (res == ExamineResult.MultipleSolutions)
        return ExamineResult.MultipleSolutions;
      if (possibleEndings.any((e) => e == newTry))
        return ExamineResult.MultipleSolutions;
      possibleEndings.add(newTry);
    }

    return ExamineResult.OneSolutionNotLogicalInferable;
  }
}
