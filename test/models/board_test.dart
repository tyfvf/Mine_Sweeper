import 'package:flutter_test/flutter_test.dart';
import 'package:mine_sweeper/models/board.dart';

main() {
  test("Win game", () {
    Board board = Board(
      lines: 2,
      columns: 2,
      amntBombs: 0,
    );

    board.fields[0].mining();
    board.fields[3].mining();

    // Playing
    board.fields[0].alterMark();
    board.fields[1].open();
    board.fields[3].alterMark();
    board.fields[2].open();

    expect(board.resolved, isTrue);
  });
}
