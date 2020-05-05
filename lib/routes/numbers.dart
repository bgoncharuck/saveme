import 'package:flutter/material.dart';
import 'package:saveme/modules/numbers_list.dart';
import 'package:saveme/style/themes.dart';
import 'package:saveme/widgets/navigation_button.dart';

class SaveMeNumbers extends StatefulWidget {
  @override
  _SaveMeNumbersState createState() => _SaveMeNumbersState();
}

class _SaveMeNumbersState extends State<SaveMeNumbers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            (Numbers.isNotEmpty)
                ? Row(
                    children: <Widget>[
                      NavigationButton(
                        navigate: "/settings",
                        name: "Settings",
                        icon: Icons.arrow_back,
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                    ],
                  )
                : Container(),
            Expanded(
              child: NumbersList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.of(context).pushNamed("/numbers/add");
          });
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
