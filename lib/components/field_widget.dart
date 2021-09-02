import 'package:flutter/material.dart';
import 'package:mine_sweeper/models/field.dart';

class FieldWidget extends StatelessWidget {
  final Field field;
  final void Function(Field) onOpen;
  final void Function(Field) onAlterMark;

  FieldWidget({
    required this.field,
    required this.onOpen,
    required this.onAlterMark,
  });

  Widget _getImage() {
    int amntMines = field.amntMinesInNeighbourhood;

    if (field.opened && field.mined && field.exploded) {
      return Image.asset("assets/images/bomb_0.jpeg");
    } else if (field.opened && field.mined) {
      return Image.asset("assets/images/bomb_1.jpeg");
    } else if (field.opened) {
      return Image.asset("assets/images/opened_$amntMines.jpeg");
    } else if (field.marked) {
      return Image.asset("assets/images/flag.jpeg");
    } else {
      return Image.asset("assets/images/closed.jpeg");
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onOpen(field),
      onLongPress: () => onAlterMark(field),
      child: _getImage(),
    );
  }
}
