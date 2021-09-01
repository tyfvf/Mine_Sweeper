import 'package:flutter_test/flutter_test.dart';
import 'package:mine_sweeper/models/table.dart';

main() {
  test("Win game", () {
    Table table = Table(
      lines: 2,
      columns: 2,
      amntBombs: 0,
    );

    table.fields[0].mining();
    table.fields[3].mining();

    // Playing
    table.fields[0].alterMark();
    table.fields[1].open();
    table.fields[3].alterMark();
    table.fields[2].open();

    expect(table.resolved, isTrue);
  });
}
