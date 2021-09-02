import 'package:flutter/material.dart';
import 'package:mine_sweeper/components/board_widget.dart';
import 'package:mine_sweeper/components/result_widget.dart';
import 'package:mine_sweeper/models/board.dart';
import 'package:mine_sweeper/models/explosion_exception.dart';
import 'package:mine_sweeper/models/field.dart';

class MineSweeperApp extends StatefulWidget {
  @override
  _MineSweeperAppState createState() => _MineSweeperAppState();
}

class _MineSweeperAppState extends State<MineSweeperApp> {
  bool? _win;
  Board _board = Board(
    lines: 12,
    columns: 12,
    amntBombs: 3,
  );

  void _restart() {
    setState(() {
      _win = null;
      _board.restart();
    });
  }

  void _open(Field field) {
    if (_win != null) {
        return;
      }
    
    setState(() {
      try {
        field.open();
        if (_board.resolved) {
          _win = true;
        }
      } on ExplosionException {
        _win = false;
        _board.revealBombs();
      }
    });
  }

  void _alterMark(Field field) {
    if (_win != null) {
        return;
      }

    setState(() {
      field.alterMark();
      if (_board.resolved) {
        _win = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          win: _win,
          onRestart: _restart,
        ),
        body: Container(
          child: BoardWidget(
            board: _board,
            onOpen: _open,
            onAlterMark: _alterMark,
          ),
        ),
      ),
    );
  }
}
