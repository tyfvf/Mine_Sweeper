import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mine_sweeper/models/score.dart';
import 'package:mine_sweeper/repository/scoredb_repository.dart';
import 'package:mine_sweeper/screens/home_screen.dart';

class ResultWidget extends StatefulWidget implements PreferredSizeWidget {
  final bool? win;
  final Function()? onRestart;
  final int amntOfBombs;

  ResultWidget({
    required this.win,
    required this.onRestart,
    required this.amntOfBombs,
  });

  @override
  _ResultWidgetState createState() => _ResultWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(120);
}

class _ResultWidgetState extends State<ResultWidget> {
  int time = 0;
  late String difficulty = widget.amntOfBombs == 40
      ? "Medium"
      : widget.amntOfBombs == 70
          ? "Hard"
          : "Easy";

  Timer _timer = Timer(Duration(seconds: 1), () {});

  @override
  void initState() {
    super.initState();

    countTime();
  }

  void countTime() {
    time = 0;
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        setState(() {
          time += 1;
        });
      },
    );
  }

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
      Score score = Score(
        seconds: time,
        difficulty: difficulty,
      );

      var repository = ScoreDBRepository();
      repository.insert(score);

      _timer.cancel();
      return Icons.sentiment_very_satisfied;
    } else {
      _timer.cancel();
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                icon: Icon(Icons.arrow_back),
              ),
              CircleAvatar(
                backgroundColor: _getColor(),
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    countTime();
                    widget.onRestart!();
                  },
                  icon: Icon(
                    _getIcon(),
                    color: Colors.black,
                    size: 35,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Text(
                  "${time.toString()} sec",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
