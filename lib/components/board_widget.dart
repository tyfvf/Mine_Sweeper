import 'package:flutter/material.dart';
import 'package:mine_sweeper/components/field_widget.dart';
import 'package:mine_sweeper/models/board.dart';
import 'package:mine_sweeper/models/field.dart';

class BoardWidget extends StatelessWidget {
  final Board? board;
  final void Function(Field) onOpen;
  final void Function(Field) onAlterMark;

  BoardWidget({
    required this.board,
    required this.onAlterMark,
    required this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: board!.columns,
        children: board!.fields.map((f) {
          return FieldWidget(
            field: f,
            onOpen: onOpen,
            onAlterMark: onAlterMark,
          );
        }).toList(),
      ),
    );
  }
}
