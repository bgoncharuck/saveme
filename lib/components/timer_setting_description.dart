import 'package:flutter/material.dart';
import 'package:saveme/constants.dart';

class TimerSettingDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: defaultTheme.mainColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 32),
                  child: Text(
                    "!",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: defaultTheme.accent,
                    ),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Wrap>[
                Wrap(
                  children: <Text>[
                    Text("1. "),
                    Text(
                      "${language.setTheCallingTimerDescription[0]} ",
                    ),
                    Text(
                      "${language.setTheCallingTimerDescription[1]}.",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Wrap(
                  children: <Text>[
                    Text("2. "),
                    Text(
                      "${language.setTheCallingTimerDescription[2]} ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${language.setTheCallingTimerDescription[3]}.",
                    ),
                  ],
                ),
                Wrap(
                  children: <Text>[
                    Text("3. "),
                    Text(
                      "${language.setTheCallingTimerDescription[4]} ",
                    ),
                    Text(
                      "${language.setTheCallingTimerDescription[5]} ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: defaultTheme.mainColor),
                    ),
                    Text(
                      "${language.setTheCallingTimerDescription[6]}.",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
