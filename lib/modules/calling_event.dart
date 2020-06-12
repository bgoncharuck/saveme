import 'package:android_intent/android_intent.dart';
import 'package:android_intent/flag.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

import 'package:saveme/constants.dart';

Future asyncCallingEvent(String number) async {
  if (Platform.isAndroid) {
    AndroidIntent intent = AndroidIntent(
      action: "android.intent.action.CALL",
      data: "tel:$number",
      arguments: {
        "com.android.phone.force.slot": true,
        "Cdma_Supp": true,
        "com.android.phone.extra.slot": 0,
        //
        // for weird platforms
        "extra_asus_dial_use_dualsim": 0,
        "slot": 0,
        "simslot": 0,
        "sim_slot": 0,
        "subscription": 0,
        "Subscription": 0,
        "phone": 0,
        "com.android.phone.DialingMode": 0,
        "simSlot": 0,
        "slot_id": 0,
        "simId": 0,
        "simnum": 0,
        "phone_type": 0,
        "slotId": 0,
        "slotIdx": 0,
      },
      flags: [Flag.FLAG_ACTIVITY_NEW_TASK],
    );
    await intent.launch();
  } else if (Platform.isIOS) {
    // TODO iOS support for a direct call
    launch("tel://$number");
  }
}

void callingToMainNumber() {
  asyncCallingEvent(numbers.mainNumber.text);
}

void callingEvent() {
  callingToMainNumber();
  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
}
