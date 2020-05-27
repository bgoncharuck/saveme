import 'package:flutter/material.dart';
import 'package:saveme/components/numbers_list.dart';
import 'package:saveme/components/navigation_button.dart';
import 'package:saveme/constants.dart';

class SaveMeNumbers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: (numbers.atLeastOneNumberExist)
            ? Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      NavigationButton(
                        navigate: "/settings",
                        name: language.settingsNavigationButton,
                        icon: Icons.arrow_back,
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                    ],
                  ),
                  Expanded(
                    child: NumbersList(),
                  ),
                ],
              )
            : Center(child: Text(language.noNumbersAdded)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/numbers/add");
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
