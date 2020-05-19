import 'dart:convert';
import 'dart:async';

import 'package:saveme/constants.dart';
import 'package:saveme/models/number.dart';

abstract class INumberList {
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
  List<INumber> _numbers = [];

  @override
  Future<bool> get readFromFileSystemIfAny async {
    String listOfNumbers = await storage.read(fromFile: numbersListSaveFileName);
    if (listOfNumbers != null) {
      var numbersFromJSON = json.decode(listOfNumbers).toList();
      _numbers = [];
      for (Map<String, dynamic> mappedNumber in numbersFromJSON)
        _numbers.add(Number.fromJson(mappedNumber));
      return true;
    }
    return false;
  }

  @override
  Future<bool> get updateOnFileSystem async => await storage.write(
      data: json.encode(_numbers), asFile: numbersListSaveFileName);

  @override
  bool get atLeastOneNumberExist => _numbers.isNotEmpty;
  @override
  bool get noNumberSetted => _numbers.isEmpty;

  @override
  INumber get mainNumber => _numbers.firstWhere((INumber number) {
        if (number.isMainNumber) return true;
        return false;
      }, orElse: () => noNumber);

  @override
  bool numberIsNotAlreadyAddded(String text) => !_numbers.any((INumber number) {
        if (number.text == text) return true;
        return false;
      });

  @override
  bool numberIsAlreadyAddded(String text) => _numbers.any((INumber number) {
        if (number.text == text) return true;
        return false;
      });

  @override
  void addNumber(INumber number) {
    _numbers.add(number);
    this.updateOnFileSystem;
  }
}
