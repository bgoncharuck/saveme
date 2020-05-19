import 'dart:async';
import 'package:saveme/models/number_list.dart';
import 'package:saveme/modules/contacts_access.dart';
import 'package:saveme/modules/storage_access.dart';
import 'package:saveme/models/timer.dart';
import 'package:saveme/theme/language.dart';
import 'package:saveme/theme/style.dart';

final IDefaultTheme defaultTheme = OrangeGreyTheme();
final String numbersListSaveFileName = "numbers_list.json";
final String timerSettingSaveFileName = "timer_setting.json";
final IStorageFile storage = DefaultStorage();
final INumberList numbers = DefaultNumberList();
final IContactsAction contacts = DefaultContactsAction();

// not actually constants
ILanguageSetting language;
ISaveMeTimer callTimer = DefaultTimer();
StreamController<int> currentMinute;
StreamController<int> currentSecond;
Timer outerTimer;
void get fullStopTimer {
  callTimer.stop();
  outerTimer.cancel();
  print("Timer was stopped.");
}
