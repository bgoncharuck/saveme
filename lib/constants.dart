import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'package:permission_handler/permission_handler.dart';

import 'modules/storage_access.dart';
import 'models/timer.dart';
import 'theme/style.dart';

final IDefaultTheme defaultTheme = GreenGreyTheme();
final String numbersListSaveFileName = "numbers_list.json";
final String timerSettingSaveFileName = "timer_setting.json";
final StreamController<int> currentMinute = StreamController<int>();
final StreamController<int> currentSecond = StreamController<int>();
final ISaveMeTimer callTimer = DefaultTimer();
final IStorageFile storage = DefaultStorage();
Timer outerTimer;
void get fullStopTimer {
  callTimer.stop();
  outerTimer.cancel();
  print("Timer was stopped.");
}

Map<Permission, PermissionStatus> statusOf;
