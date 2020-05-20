import 'package:permission_handler/permission_handler.dart';
import 'package:contact_picker/contact_picker.dart';
import 'package:saveme/constants.dart';
import 'package:flutter/material.dart';

abstract class IContactsAction {
  Future<String> choose();
  Future<bool> getNumber(
    TextEditingController textController);
}

class DefaultContactsAction implements IContactsAction {
  @override
  Future<String> choose() async {
    if (await Permission.contacts.request().isGranted == false)
      return null;

    final ContactPicker _contactPicker = ContactPicker();
    Contact _contact = await _contactPicker.selectContact();
    return _contact.phoneNumber.number;
  }

  @override
  Future<bool> getNumber(
    TextEditingController textController) async {

    String number = await contacts.choose();
    if (number == null) return false;

    textController.text = number;
    return true;
  }
}
