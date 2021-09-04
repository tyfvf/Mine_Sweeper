import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mine_sweeper/screens/home_screen.dart';

class ResultWidget extends StatefulWidget implements PreferredSizeWidget {
  final bool? win;
  final Function()? onRestart;

  ResultWidget({
    required this.win,
    required this.onRestart,
  });

  @override
  _ResultWidgetState createState() => _ResultWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(120);
}

class _ResultWidgetState extends State<ResultWidget> {
  Color? _getColor() {
    if (widget.win == null) {
      return Colors.yellow;
    } else if (widget.win == true) {
      return Colors.green[300];
    } else {
      return Colors.red[300];
    }
  }

  IconData _getIcon() {
    if (widget.win == null) {
      return Icons.sentiment_satisfied;
    } else if (widget.win == true) {
      return Icons.sentiment_very_satisfied;
    } else {
      return Icons.sentiment_very_dissatisfied;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                icon: Icon(Icons.arrow_back),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width / 4, 0, 0, 0),
                child: CircleAvatar(
                  backgroundColor: _getColor(),
                  child: IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: widget.onRestart,
                    icon: Icon(
                      _getIcon(),
                      color: Colors.black,
                      size: 35,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
