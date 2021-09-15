class Score {
  final int? id;
  final int seconds;
  final String difficulty;

  Score({required this.seconds, required this.difficulty, this.id});

  //Send to DB
  Map<String, dynamic> toMap() {
    return {
      "id": this.id,
      "seconds": this.seconds,
      "difficulty": this.difficulty,
    };
  }

  //Retrieve from DB
  factory Score.fromMap(Map<String, dynamic> map) {
    return Score(
      seconds: map["seconds"],
      difficulty: map["difficulty"],
      id: map["id"],
    );
  }
}
