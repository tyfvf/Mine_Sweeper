import 'package:flutter_test/flutter_test.dart';
import 'package:mine_sweeper/models/field.dart';

main() {
  group("Field", () {
    test("open field with explosion", () {
      Field c = Field(line: 0, column: 0);
      c.mining();

      expect(c.open, throwsException);
    });

    test("open field with no explosion", () {
      Field c = Field(line: 0, column: 0);
      c.open();

      expect(c.opened, isTrue);
    });

    test("Add not neighbour", () {
      Field c1 = Field(line: 0, column: 0);
      Field c2 = Field(line: 1, column: 3);
      c1.addNeighbour(c2);
      expect(c1.neighbours.isEmpty, isTrue);
    });

    test("Add neighbour", () {
      Field c1 = Field(line: 3, column: 3);
      Field c2 = Field(line: 3, column: 4);
      Field c3 = Field(line: 2, column: 2);
      Field c4 = Field(line: 4, column: 4);

      c1.addNeighbour(c2);
      c1.addNeighbour(c3);
      c1.addNeighbour(c4);

      expect(c1.neighbours.length, 3);
    });

    test("Bombs on neighbourhood", () {
      Field c1 = Field(line: 3, column: 3);

      Field c2 = Field(line: 3, column: 4);
      c2.mining();

      Field c3 = Field(line: 2, column: 2);

      Field c4 = Field(line: 4, column: 4);
      c4.mining();

      c1.addNeighbour(c2);
      c1.addNeighbour(c3);
      c1.addNeighbour(c4);

      expect(c1.amntMinesInNeighbourhood, 2);
    });
  });
}
