import 'package:mine_sweeper/models/db_local.dart';
import 'package:mine_sweeper/models/irepository.dart';
import 'package:mine_sweeper/models/score.dart';

abstract class ScoreRepository implements IRepository<Score>{
  //All types of acess to data
  late DBLocal dblocal;
}