import 'package:permission_handler/permission_handler.dart';
import 'package:contact_picker/contact_picker.dart';
import 'package:saveme/constants.dart';
import 'package:flutter/material.dart';

abstract class IContactsAction {
  Future<String> choose();
}

class DefaultContactsAction implements IContactsAction {
  @override
  Future<String> choose() async {
    if (await Permission.contacts.request().isGranted) {
      final ContactPicker _contactPicker = ContactPicker();
      Contact _contact = await _contactPicker.selectContact();
      return _contact.phoneNumber.number;
    }
  }
}

Future<bool> getNumberFromContactsList(
    TextEditingController textController) async {
  String number = await contacts.choose();
  if (number != null) {
    textController.text = number;
    return true;
  }
  return false;
}
// void
