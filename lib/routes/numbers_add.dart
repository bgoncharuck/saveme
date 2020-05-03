import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saveme/widgets/navigation_button.dart';
import 'package:saveme/modules/numbers_list.dart';
import 'package:saveme/models/number.dart';

class SaveMeNumbersAdd extends StatefulWidget {
  @override
  _SaveMeNumbersAddState createState() => _SaveMeNumbersAddState();
}

class _SaveMeNumbersAddState extends State<SaveMeNumbersAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            (NumbersList.isNotEmpty())
                // User need to have at least one number, to see navigation
                ? Row(
                    children: <Widget>[
                      NavigationButton(
                        navigate: "/numbers",
                        name: "Numbers List",
                        icon: Icons.arrow_back,
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                    ],
                  )
                : Container(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Add Number"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FloatingActionButton(
                        heroTag: "cleanNumber",
                        backgroundColor: Colors.red,
                        onPressed: () {
                          setState(() {
                            if (NumbersList.isNotEmpty())
                              Navigator.of(context).pushNamed("/numbers");
                            // User need to have at least one number, if not - exit
                            else
                              SystemChannels.platform
                                  .invokeMethod('SystemNavigator.pop');
                          });
                        },
                        child: Icon(
                          Icons.close,
                        ),
                      ),
                      FloatingActionButton(
                        heroTag: "addNumber",
                        onPressed: () {
                          setState(() {
                            NumbersList.add(DebugNumber);
                            Navigator.of(context).pushNamed("/numbers");
                          });
                        },
                        child: Icon(
                          Icons.done,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
