import 'package:flutter/material.dart';

import 'point.dart';

class Sudoku extends ChangeNotifier {
  static const int EMPTYSLOT = -1;

  Point currentP = Point(0, 0);
  bool isActive = false;
  Sudoku? original;

  List<int> gameArea = List.filled(81, EMPTYSLOT);

  int operator [](Point pos) => get(pos.x, pos.y);
  void operator []=(Point pos, int value) => set(pos.x, pos.y, value);

  int get(int x, int y) => gameArea[x + y * 9];

  int getP(Point p) => gameArea[p.x + p.y * 9];

  void set(int x, int y, int value) {
    gameArea[x + y * 9] = value;
    notifyListeners();
  }

  bool isFree(int x, int y) => get(x, y) == EMPTYSLOT;

  bool fitsNumber(int x, int y, int number) {
    for (int yb = y - (y % 3); yb < 3 + y - (y % 3); yb++) {
      for (int xb = x - (x % 3); xb < 3 + x - (x % 3); xb++) {
        if (this[Point(xb, yb)] == number) return false;
      }
    }

    for (int xr = 0; xr < 9; xr++) {
      if (this[Point(xr, y)] == number) return false;
    }

    for (int yc = 0; yc < 9; yc++) {
      if (this[Point(x, yc)] == number) return false;
    }

    return true;
  }

  List<Point> getFreePlaces() {
    List<Point> freePlaces = [];
    for (int i = 0; i < gameArea.length; i++) {
      if (gameArea[i] == EMPTYSLOT) freePlaces.add(Point(i % 9, i ~/ 9));
    }
    return freePlaces;
  }

  bool isValidSolved() {
    if (getFreePlaces().isNotEmpty) return false;

    List<List<int>> blocks = List.generate(9, (_) => []);
    List<List<int>> rows = List.generate(9, (_) => []);
    List<List<int>> columns = List.generate(9, (_) => []);

    for (int y = 0; y < 9; y++) {
      for (int x = 0; x < 9; x++) {
        if (this[Point(x, y)] == EMPTYSLOT) return false;
        if (blocks[(x ~/ 3) + (y ~/ 3) * 3].contains(this[Point(x, y)]))
          return false;
        else
          blocks[(x ~/ 3) + (y ~/ 3) * 3].add(this[Point(x, y)]);
        if (rows[y].contains(this[Point(x, y)]))
          return false;
        else
          rows[y].add(this[Point(x, y)]);
        if (columns[x].contains(this[Point(x, y)]))
          return false;
        else
          columns[x].add(this[Point(x, y)]);
      }
    }

    return true;
  }

  Sudoku clone() {
    Sudoku clone = Sudoku();
    for (int i = 0; i < gameArea.length; i++) {
      clone.gameArea[i] = this.gameArea[i];
    }
    return clone;
  }

  @override
  bool operator ==(Object other) {
    if (other is! Sudoku) return false;
    Sudoku s = other;
    for (int i = 0; i < gameArea.length; i++) {
      if (s.gameArea[i] != gameArea[i]) return false;
    }
    return true;
  }
}
