import 'package:android_intent/android_intent.dart';
import 'package:android_intent/flag.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;

import 'package:saveme/constants.dart';

Future _asyncCallingEvent() async {
  if (Platform.isAndroid) {
    AndroidIntent intent = AndroidIntent(
      action: "android.intent.action.CALL",
      data: "tel:${numbers.mainNumber.text}",
      flags: [Flag.FLAG_ACTIVITY_NEW_TASK],
    );
    await intent.launch();
  }
  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
}

void callingEvent() {
  _asyncCallingEvent();
}
