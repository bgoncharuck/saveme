abstract class INumber {
  String text;
  bool isMainNumber;
}

class Number implements INumber {
  bool isMainNumber;
  String text;
  Number(this.text, {bool isMain = false}) {
    isMainNumber = isMain;
  }
}

final INumber noNumber = Number("");
final INumber debugNumber = Number("DebugNumber");
