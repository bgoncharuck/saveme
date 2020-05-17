import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'modules/storage_access.dart';
import 'models/timer.dart';
import 'theme/style.dart';

final IDefaultTheme defaultTheme = OrangeGreyTheme();
final String numbersListSaveFileName = "numbers_list.json";
final String timerSettingSaveFileName = "timer_setting.json";
final IStorageFile storage = DefaultStorage();
StreamController<int> currentMinute;
StreamController<int> currentSecond;
ISaveMeTimer callTimer = DefaultTimer();
Timer outerTimer;
void get fullStopTimer {
  callTimer.stop();
  outerTimer.cancel();
  print("Timer was stopped.");
}

Map<Permission, PermissionStatus> statusOf;
