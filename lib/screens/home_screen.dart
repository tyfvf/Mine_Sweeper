import 'package:flutter/material.dart';
import 'package:mine_sweeper/screens/connection.dart';
import 'package:mine_sweeper/screens/mine_sweeper_app.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final difficulty = ["Easy", "Medium", "Hard"];
  String value = "Medium";

  int get amntOfBombs {
    if (value == "Medium") {
      return 40;
    } else if (value == "Easy") {
      return 20;
    } else {
      return 70;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Mine",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sweeper",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  "assets/images/icon.png",
                  width: 30,
                  height: 30,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 250),
              child: Text(
                "See HighScore",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w100),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Connection()));
              }, 
              child: Text("HIGHSCORES"),
              style: TextButton.styleFrom(primary: Colors.green[900]),
            ),
            Text(
                "Choose Difficulty",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w100),
            ),
            DropdownButton<String>(
              value: value,
              items: difficulty.map(buildMenuItem).toList(),
              onChanged: (value) => setState(
                  () => value == null ? value == null : this.value = value),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MineSweeperApp(amntOfBombs)));
              },
              icon: Icon(Icons.play_arrow),
              iconSize: 25,
            )
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
                  : TextStyle(color: Colors.green[900], fontWeight: FontWeight.bold),
        ),
      );
}
