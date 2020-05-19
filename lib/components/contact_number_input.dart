import 'package:flutter/material.dart';
import 'package:saveme/models/number.dart';
import 'package:saveme/components/numbers_list.dart';
import 'package:saveme/constants.dart';
import 'package:saveme/modules/contacts_access.dart';

class ContactNumberInputForm extends StatefulWidget {
  Function onEditingComplete;
  IconData icon;
  bool isEditable;
  ContactNumberInputForm(
      {@required this.onEditingComplete,
      @required this.icon,
      @required this.isEditable});

  @override
  _ContactNumberInputFormState createState() => _ContactNumberInputFormState();
}

class _ContactNumberInputFormState extends State<ContactNumberInputForm> {
  final TextEditingController _editedNumber = TextEditingController();
  final _mainNumberFormKey = GlobalKey<FormState>();
  bool contactWasPicked = false;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
