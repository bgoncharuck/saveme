import 'dart:convert';
import 'dart:async';

import 'package:saveme/constants.dart';
import 'package:saveme/models/number.dart';

abstract class INumberList {
  List<INumber> numbers;
  Future<bool> get readFromFileSystemIfAny;
  Future<bool> get updateOnFileSystem;
  bool get atLeastOneNumberExist;
  bool get noNumberSetted;
  INumber get mainNumber;
  bool numberIsNotAlreadyAddded(String text);
  bool numberIsAlreadyAddded(String text);
  void addNumber(INumber number);
}

class DefaultNumberList implements INumberList {
  List<INumber> numbers = [];

  @override
  Future<bool> get readFromFileSystemIfAny async {
    String listOfNumbers =
        await storage.read(fromFile: numbersListSaveFileName);
    if (listOfNumbers == null) return false;
    if (this.numbers.isNotEmpty) this.numbers = [];

    var numbersFromJSON = json.decode(listOfNumbers).toList();
    for (Map<String, dynamic> mappedNumber in numbersFromJSON)
      this.numbers.add(Number.fromJson(mappedNumber));
    return true;
  }

  @override
  Future<bool> get updateOnFileSystem async => await storage.write(
      data: json.encode(this.numbers), asFile: numbersListSaveFileName);

  @override
  bool get atLeastOneNumberExist => this.numbers.isNotEmpty;
  @override
  bool get noNumberSetted => this.numbers.isEmpty;

  @override
  INumber get mainNumber => this.numbers.firstWhere((INumber number) {
        if (number.isMainNumber) return true;
        return false;
      }, orElse: () => noNumber);

  @override
  bool numberIsNotAlreadyAddded(String text) =>
      !this.numbers.any((INumber number) {
        if (number.text == text) return true;
        return false;
      });

  @override
  bool numberIsAlreadyAddded(String text) => this.numbers.any((INumber number) {
        if (number.text == text) return true;
        return false;
      });

  @override
  void addNumber(INumber number) {
    number.text = number.text.replaceAll(RegExp(r"\s\b|\b\s"), "");
    this.numbers.add(number);
    this.updateOnFileSystem;
  }
}
