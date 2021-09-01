import 'explosion_exception.dart';

class Field {
  final int line;
  final int column;
  final List<Field> neighbours = [];

  bool _opened = false;
  bool _marked = false;
  bool _mined = false;
  bool _exploded = false;

  Field({
    required this.line,
    required this.column,
  });

  void addNeighbour(Field neighbour) {
    final deltaLine = (line - neighbour.line).abs();
    final deltaColumn = (column - neighbour.column).abs();

    if (deltaLine == 0 && deltaColumn == 0) {
      return;
    }

    if (deltaLine <= 1 && deltaColumn <= 1) {
      neighbours.add(neighbour);
    }
  }

  void open() {
    if (_opened) {
      return;
    }

    _opened = true;

    if (_mined) {
      _exploded = true;
      throw ExplosionException();
    }

    if (safeNeighbourhood) {
      neighbours.forEach((n) => n.open());
    }
  }

  void revealBomb() {
    if (_mined) {
      _opened = true;
    }
  }

  void mining() {
    _mined = true;
  }

  void alterMark() {
    _marked = !_marked;
  }

  void restart() {
    _opened = false;
    _marked = false;
    _mined = false;
    _exploded = false;
  }

  bool get mined {
    return _mined;
  }

  bool get exploded {
    return _exploded;
  }

  bool get opened {
    return _opened;
  }

  bool get marked {
    return _marked;
  }

  bool get resolved {
    bool minedAndMarked = mined && marked;
    bool safeAndOpened = !mined && opened;
    return minedAndMarked || safeAndOpened;
  }

  bool get safeNeighbourhood {
    return neighbours.every((n) => !n._mined);
  }

  int get amntMinesInNeighbourhood {
    return neighbours.where((n) => n._mined).length;
  }
}
