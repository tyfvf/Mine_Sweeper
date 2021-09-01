import 'dart:math';

import 'field.dart';

class Table {
  final int lines;
  final int columns;
  final int amntBombs;

  final List<Field> _fields = [];

  Table({
    required this.lines,
    required this.columns,
    required this.amntBombs,
  }) {
    _createFields();
    _connectNeighbours();
    _sortMines();
  }

  void restart() {
    _fields.forEach((f) => f.restart());
    _sortMines();
  }

  void revealBombs() {
    _fields.forEach((f) => f.revealBomb());
  }

  void _createFields() {
    for (int l = 0; l < lines; l++) {
      for (int c = 0; c < columns; c++) {
        _fields.add(Field(line: l, column: c));
      }
    }
  }

  void _connectNeighbours() {
    for (var field in _fields) {
      for (var neighbour in _fields) {
        field.addNeighbour(neighbour);
      }
    }
  }

  void _sortMines() {
    int sorteds = 0;

    if (amntBombs > lines * columns) {
      return;
    }

    while (sorteds < amntBombs) {
      int i = Random().nextInt(_fields.length);

      if (!_fields[i].mined) {
        sorteds++;
        _fields[i].mining();
      }
    }
  }

  List<Field> get fields {
    return _fields;
  }

  bool get resolved {
    return _fields.every((f) => f.resolved);
  }
}
