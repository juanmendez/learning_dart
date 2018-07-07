import 'package:test/test.dart';
import '../example/learning_dart_example.dart';

void main() {
  group('Function var', () {
    test("passing a method as a param", () {
      expect(greatestBand().name, equals("Led Zeppelin"));
      expect(checkBandsName(bandF: greatestBand, bandName: "Led Zeppelin"),
          equals(true));
    });

    test("passing anonymous function", () {
      var b = Band(name: "Deep Purple", album: "Led Zeppelin I", year: 1968);
      expect(
          checkBandsName(bandF: () => b, bandName: "Aerosmith"), equals(false));
    });
  });

  group("params features", () {
    test("default params", () {
      //num2 is 0 by default
      expect(sum(num1: 5), equals(5));
    });

    test("optinal params", () {
      expect(sumSeveral(1,2,3), equals(6));
      expect(sumSeveral(1,2), equals(3));
      expect(sumSeveral(1), equals(1));
      expect(makeBandFromParams("Aerosmith").album, equals("Aerosmith"));
      expect(makeBandFromParams("Aerosmith").year, equals(2018));
    });
  });

  group("lexical scope", () {
    test("lexical scope", () {
      topFunction();
    });

    test("lexical closures", (){
      Band band = makeBandFromParams("Deep Purple", "Deep Purple", 1969);

      //so band is kept inside expressBand closure. We can then just call the method return, and it knows the band!
      Function expressFun = expressBand(band);
      expect(expressFun("note:"), equals("note: ${band.name} made ${band.album} in ${band.year}"));
    });
  });
}
