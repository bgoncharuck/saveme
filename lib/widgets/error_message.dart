import 'package:flutter/material.dart';
import 'package:saveme/style/themes.dart';

class SaveMeErrorMessage extends StatelessWidget {
  final String description;
  final String details;
  SaveMeErrorMessage(this.description, this.details);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Error",
                    style: TextStyle(
                      fontSize: 32,
                      color: defaultTheme.accent,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(fontSize: 22),
                  ),
                  Text(
                    details,
                    style: TextStyle(
                      fontSize: 22,
                      color: defaultTheme.accent,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
