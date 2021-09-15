import 'package:mine_sweeper/models/db_local.dart';
import 'package:mine_sweeper/models/score.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mine_sweeper/repository/score_repository.dart';

class ScoreDBRepository implements ScoreRepository {
  @override
  late DBLocal dblocal;

  ScoreDBRepository() {
    this.dblocal = DBLocal(
      table: "scores",
    );
  }

  @override
  Future<Score> find(int id) async {
    Database database = await dblocal.getConnection();

    List<Map<String, dynamic>> data = await database.query(
      dblocal.table,
      where: "id=?",
      whereArgs: [id],
    );

    database.close();
    return Score.fromMap(data.first);
  }

  @override
  Future<int> insert(Score entity) async {
    Database database = await dblocal.getConnection();
    int id = await database.insert(dblocal.table, entity.toMap());
    database.close();
    return id;
  }

  @override
  Future<int> remove({required String conditions, required List conditionsValue}) async {
    Database database = await dblocal.getConnection();
    int id = await database.delete(
      dblocal.table,
      where: conditions,
      whereArgs: conditionsValue,
    );
    database.close();
    return id;
  }

  @override
  Future<List<Score>> search() async {
    Database database = await dblocal.getConnection();
    var data = await database.query(dblocal.table);
    List<Score> scores = data.map((objMap) => Score.fromMap(objMap)).toList();
    database.close();
    return scores;
  }

  @override
  Future<int> update({required Score entity, required String conditions, required List conditionsValue,}) async {
    Database database = await dblocal.getConnection();
    int id = await database.update(
      dblocal.table,
      entity.toMap(),
      where: conditions,
      whereArgs: conditionsValue,
    );
    database.close();
    return id;
  }
}