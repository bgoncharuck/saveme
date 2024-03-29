import 'package:saveme/models/number_list.dart';
import 'package:saveme/modules/contacts_access.dart';
import 'package:saveme/models/timer.dart';
import 'package:saveme/theme/language.dart';
import 'package:saveme/theme/style.dart';

final IDefaultTheme defaultTheme = OrangeGreyTheme();
final String numbersListSaveFileName = "numbers_list.json";
final String timerSettingSaveFileName = "timer_setting.json";
final INumberList numbers = DefaultNumberList();
final IContactsAction contacts = DefaultContactsAction();
final ISaveMeTimer callTimer = DefaultTimer();
final ILanguageSetting language = systemLanguage;
