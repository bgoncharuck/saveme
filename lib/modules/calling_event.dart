import 'package:android_intent/android_intent.dart';
import 'package:android_intent/flag.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;

import 'package:saveme/constants.dart';

Future asyncCallingEvent(String number) async {
  if (Platform.isAndroid) {
    AndroidIntent intent = AndroidIntent(
      action: "android.intent.action.CALL",
      data: "tel:${number}",
      flags: [Flag.FLAG_ACTIVITY_NEW_TASK],
    );
    await intent.launch();
  }
}

void callingToMainNumber() {
  asyncCallingEvent(numbers.mainNumber.text);
}

void callingEvent() {
  callingToMainNumber();
  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
}
