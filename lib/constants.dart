import 'dart:async';
import 'package:saveme/modules/contacts_access.dart';
import 'package:saveme/modules/storage_access.dart';
import 'package:saveme/models/timer.dart';
import 'package:saveme/theme/style.dart';

final IDefaultTheme defaultTheme = OrangeGreyTheme();
final String numbersListSaveFileName = "numbers_list.json";
final String timerSettingSaveFileName = "timer_setting.json";
final IStorageFile storage = DefaultStorage();
ISaveMeTimer callTimer = DefaultTimer();
IContactsAction contacts = DefaultContactsAction();
StreamController<int> currentMinute;
StreamController<int> currentSecond;
Timer outerTimer;
void get fullStopTimer {
  callTimer.stop();
  outerTimer.cancel();
  print("Timer was stopped.");
}
