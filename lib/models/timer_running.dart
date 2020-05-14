import 'dart:async';

import 'package:flutter/cupertino.dart';

abstract class TimerRunningCommand {
  DateTime id;
  double get minute;
  double get second;
  bool get isStop;
  void start({double minutes = 0, double seconds = 0, Function onFinish()});
  void stop({DateTime id});
}
