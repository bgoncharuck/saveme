import 'package:flutter/services.dart';
import 'package:saveme/constants.dart';

void callingEvent() {
  print("Calling! Beep beep.");
  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
}
