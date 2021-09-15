import 'package:flutter/material.dart';
import 'package:mine_sweeper/repository/scoredb_repository.dart';
import 'package:mine_sweeper/screens/highscores.dart';

class Connection extends StatefulWidget {
  @override
  _ConnectionState createState() => _ConnectionState();
}

class _ConnectionState extends State<Connection> {
  @override
  Widget build(BuildContext context) {
    var scoreDBRepository = ScoreDBRepository();

    return FutureBuilder(
      future: scoreDBRepository.search(),
      builder: builder,
    );
  }

  Widget builder(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      default:
        return HighScore(snapshot.data);
    }
  }
}
