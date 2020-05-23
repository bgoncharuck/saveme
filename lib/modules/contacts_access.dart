import 'package:permission_handler/permission_handler.dart';
import 'package:contact_picker/contact_picker.dart';
import 'package:saveme/constants.dart';
import 'package:flutter/material.dart';

abstract class IContactsAction {
  Future<Contact> choose();
  Future<String> getContact(TextEditingController textController);
}

class DefaultContactsAction implements IContactsAction {
  @override
  Future<Contact> choose() async {
    if (await Permission.contacts.request().isGranted == false) return null;

    final ContactPicker _contactPicker = ContactPicker();
    Contact _contact = await _contactPicker.selectContact();
    return _contact;
  }

  @override
  Future<String> getContact(TextEditingController textController) async {
    Contact choosed = await contacts.choose();
    if (choosed == null) return null;
    String number = choosed.phoneNumber.number;

    textController.text = number;
    return choosed.fullName;
  }
}
