import 'package:flutter/material.dart';
import 'package:mine_sweeper/components/board_widget.dart';
import 'package:mine_sweeper/components/result_widget.dart';
import 'package:mine_sweeper/models/board.dart';
import 'package:mine_sweeper/models/field.dart';

class MineSweeperApp extends StatelessWidget {
  void _restart() {
    print("restart");
  }

  void _open(Field c) {
    print("open");
  }

  void _alterMark(Field c) {
    print("Alter Mark");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          win: false,
          onRestart: _restart,
        ),
        body: Container(
          child: BoardWidget(
            board: Board(lines: 15,columns: 15,amntBombs: 10),
            onOpen: _open,
            onAlterMark: _alterMark,
          ),
        ),
      ),
    );
  }
}
