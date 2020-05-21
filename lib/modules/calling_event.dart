import 'package:android_intent/android_intent.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;

import 'package:saveme/constants.dart';

Future _asyncCallingEvent() async {
  if (Platform.isAndroid) {
    AndroidIntent intent = AndroidIntent(
      action: ,
      data: ,
      arguments: ,
    );
    await intent.launch();
  }
  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
}

void callingEvent() {
  _asyncCallingEvent();
}
