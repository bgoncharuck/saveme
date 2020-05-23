abstract class INumber {
  String text;
  String contactName;
  bool isMainNumber;

  INumber.fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}

class Number implements INumber {
  bool isMainNumber;
  String contactName;
  String text;
  Number(this.text, {bool isMain = false, this.contactName = ""}) {
    isMainNumber = isMain;
  }

  Number.fromJson(Map<String, dynamic> json)
      : text = json['number'],
        isMainNumber = json['isMainNumber'],
        contactName = json['contactName'];

  @override
  Map<String, dynamic> toJson() => {
        'number': text,
        'isMainNumber': isMainNumber,
        'contactName': contactName,
      };
}

final INumber noNumber = Number("");
final INumber debugNumber = Number("DebugNumber");
