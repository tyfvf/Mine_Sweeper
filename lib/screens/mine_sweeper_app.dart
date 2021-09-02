import 'package:flutter/material.dart';
import 'package:mine_sweeper/components/field_widget.dart';
import 'package:mine_sweeper/components/result_widget.dart';
import 'package:mine_sweeper/models/explosion_exception.dart';
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
    Field neighbour1 = Field(line: 1, column: 0);
    neighbour1.mining();
    Field neighbour2 = Field(line: 1, column: 1);
    neighbour2.mining();

    Field field = Field(line: 0, column: 0);
    field.addNeighbour(neighbour1);
    field.addNeighbour(neighbour2);

    try {
      // field.mining();
      field.alterMark();
    } on ExplosionException {}

    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          win: false,
          onRestart: _restart,
        ),
        body: Container(
          child: FieldWidget(
            field: field,
            onOpen: _open,
            onAlterMark: _alterMark,
          ),
        ),
      ),
    );
  }
}
