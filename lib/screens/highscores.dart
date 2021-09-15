import 'package:flutter/material.dart';
import 'package:mine_sweeper/models/score.dart';

class HighScore extends StatefulWidget {
  final List<Score> data;

  HighScore(this.data);

  @override
  _HighScoreState createState() => _HighScoreState(this.data);
}

class _HighScoreState extends State<HighScore> {
  final List<Score> data;
  String value = "Medium";
  final difficulty = ["Easy", "Medium", "Hard"];

  _HighScoreState(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "HIGHSCORES",
              style: TextStyle(color: Colors.green[900]),
            ),
            DropdownButton<String>(
              value: value,
              items: difficulty.map(buildMenuItem).toList(),
              onChanged: (value) => setState(
                () => value == null ? value == null : this.value = value,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Place",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text("Time (in seconds)",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: scoreBuilder,
                itemCount: this.data.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: item == "Medium"
              ? TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)
              : item == "Hard"
                  ? TextStyle(color: Colors.red, fontWeight: FontWeight.bold)
                  : TextStyle(
                      color: Colors.green[900], fontWeight: FontWeight.bold),
        ),
      );

  Widget scoreBuilder(BuildContext context, int index) {
    data.sort((a, b) => a.seconds.compareTo(b.seconds));

    Score score = data.elementAt(index);

    if (score.difficulty == value) {
      return ListTile(
        leading: Text("${index + 1}", style: TextStyle(fontWeight: FontWeight.bold),),
        trailing: Text("${score.seconds}", style: TextStyle(fontWeight: FontWeight.bold)),
      );
    } else {
      return ListTile();
    }
  }
}
