import 'package:flutter/material.dart';
import 'package:mine_sweeper/components/result_widget.dart';

class MineSweeperApp extends StatelessWidget {

  _restart(){
    print("restart");
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
          child: Text("Table"),
        ),
      ),
    );
  }
}
