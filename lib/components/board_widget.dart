import 'package:flutter/material.dart';
import 'package:mine_sweeper/models/board.dart';
import 'package:mine_sweeper/models/field.dart';


class BoardWidget extends StatelessWidget {
  final Board board;
  final void Function(Field) onOpen;
  final void Function(Field) onAlterMark; 

  BoardWidget({
    required this.board,
    required this.onAlterMark,
    required this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
