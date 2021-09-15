import 'package:flutter/material.dart';
import 'package:mine_sweeper/components/board_widget.dart';
import 'package:mine_sweeper/components/result_widget.dart';
import 'package:mine_sweeper/models/board.dart';
import 'package:mine_sweeper/models/explosion_exception.dart';
import 'package:mine_sweeper/models/field.dart';

class MineSweeperApp extends StatefulWidget {
  final int amntOfBombs;

  MineSweeperApp(this.amntOfBombs);

  @override
  _MineSweeperAppState createState() => _MineSweeperAppState(amntOfBombs);
}

class _MineSweeperAppState extends State<MineSweeperApp> {
  final int amntOfBombs;

  _MineSweeperAppState(this.amntOfBombs);

  bool? _win;
  Board? _board;

  void _restart() {
    setState(() {
      _win = null;
      _board!.restart();
    });
  }

  void _open(Field field) {
    if (_win != null) {
      return;
    }

    setState(() {
      try {
        field.open();
        if (_board!.resolved) {
          _win = true;
        }
      } on ExplosionException {
        _win = false;
        _board!.revealBombs();
      }
    });
  }

  void _alterMark(Field field) {
    if (_win != null) {
      return;
    }

    setState(() {
      field.alterMark();
      if (_board!.resolved) {
        _win = true;
      }
    });
  }

  Board? _getBoard(double width, double height) {
    if (_board == null) {
      int amntColumns = 15;
      double fieldSize = width / amntColumns;
      int amntLines = (height / fieldSize).floor();

      _board = Board(
        lines: amntLines,
        columns: amntColumns,
        amntBombs: amntOfBombs,
      );
    }

    return _board;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResultWidget(
        win: _win,
        onRestart: _restart,
        amntOfBombs: amntOfBombs,
      ),
      body: Container(
          color: Colors.grey,
          child: LayoutBuilder(
            builder: (ctx, constraints) {
              return BoardWidget(
                board: _getBoard(constraints.maxWidth, constraints.maxHeight),
                onAlterMark: _alterMark,
                onOpen: _open,
              );
            },
          )),
    );
  }
}
