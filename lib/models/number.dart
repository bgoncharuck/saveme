abstract class INumber {
  String text;
  bool isMainNumber;

  INumber.fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}

class Number implements INumber {
  bool isMainNumber;
  String text;
  Number(this.text, {bool isMain = false}) {
    isMainNumber = isMain;
  }

  @override
  Number.fromJson(Map<String, dynamic> json)
      : text = json['number'],
        isMainNumber = json['isMainNumber'];

  @override
  Map<String, dynamic> toJson() => {
        'number': text,
        'isMainNumber': isMainNumber,
      };
}

final INumber noNumber = Number("");
final INumber debugNumber = Number("DebugNumber");
