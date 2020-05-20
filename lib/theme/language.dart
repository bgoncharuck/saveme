import 'dart:io' show Platform;

abstract class ILanguageSetting {
  String numberMustBeValid;
  String numberAlreadyAdded;
  String mainPhoneNumberLabel;
  String labelError;
  String stopTheTimerButtonLabel;
  String stopTheTimerAlertTitle;
  String stopTheTimerAlertContent;
  String stopTheTimerAlertActionYes;
  String stopTheTimerAlertActionNo;
  String minutes;
  String seconds;
  String min;
  String sec;
  String setTheCallingTimerDescription;
  String loadFilesAccessErrorText;
  String settingsNavigationButton;
  String numbersNavigationButton;
  String addTheNumberDescription;
  String startTimerAgainLabel;
  String startTimerAgainAction;
}

class EnglishLanguage implements ILanguageSetting {
  String numberMustBeValid = 'Number must to be valid';
  String numberAlreadyAdded = "You already added this number";
  String mainPhoneNumberLabel = "Main Phone Number To Call";
  String labelError = "Error";
  String stopTheTimerButtonLabel = "Stop";
  String stopTheTimerAlertTitle = "Stop The Timer?";
  String stopTheTimerAlertContent = "Are you okay?";
  String stopTheTimerAlertActionYes = "Yes";
  String stopTheTimerAlertActionNo = "No";
  String minutes = "minutes";
  String seconds = "seconds";
  String min = "min";
  String sec = "sec";
  String setTheCallingTimerDescription =
      "Set the Calling timer.\nNext time you run the app, it starts.";
  String loadFilesAccessErrorText =
      "My Lord, you did not grant me access to a storage.\nI can't save or load these config files:\n";
  String settingsNavigationButton = "Settings";
  String numbersNavigationButton = "Numbers To Call";
  String addTheNumberDescription = "The number of the person you will calling for a help.";
  String startTimerAgainLabel = "Timer Was Stopped";
  String startTimerAgainAction = "Start Again";
}

// @TODO
class GermanLanguage implements ILanguageSetting {
  String numberMustBeValid = 'Die Nummer muss gültig sein';
  String numberAlreadyAdded = "Sie haben diese Nummer bereits hinzugefügt";
  String mainPhoneNumberLabel = "";
  String labelError = "";
  String stopTheTimerButtonLabel = "";
  String stopTheTimerAlertTitle = "";
  String stopTheTimerAlertContent = "";
  String stopTheTimerAlertActionYes = "";
  String stopTheTimerAlertActionNo = "";
  String minutes = "";
  String seconds = "";
  String min = "";
  String sec = "";
  String setTheCallingTimerDescription =
      "Stellen Sie den Anruf-Timer ein.\nWenn Sie die App das nächste Mal ausführen, wird sie gestartet.";
  String loadFilesAccessErrorText = "";
  String settingsNavigationButton = "";
  String numbersNavigationButton = "";
  String addTheNumberDescription = "";
  String startTimerAgainLabel = "";
  String startTimerAgainAction = "";
}

class UkranianLanguage implements ILanguageSetting {
  String numberMustBeValid = "Не є номером телефону";
  String numberAlreadyAdded = "Цей номер вже додано";
  String mainPhoneNumberLabel = "Основний Телефон Для Дзвінка";
  String labelError = "Помилка";
  String stopTheTimerButtonLabel = "Стоп";
  String stopTheTimerAlertTitle = "Зупинити Таймер?";
  String stopTheTimerAlertContent = "Ви почуваєтесь краще?";
  String stopTheTimerAlertActionYes = "Так";
  String stopTheTimerAlertActionNo = "Ні";
  String minutes = "хвилин";
  String seconds = "секунд";
  String min = "хв";
  String sec = "сек";
  String setTheCallingTimerDescription =
      "Встановіть таймер дзвінку.\nВідлік почнеться під час наступного запуску.";
  String loadFilesAccessErrorText =
      "Господарю, Ви не надали мені прав доступу до файлів.\nЯ не зможу зберегти або завантажити ці файли налаштувань:\n";
  String settingsNavigationButton = "Налаштування";
  String numbersNavigationButton = "Номери Для Дзвінка";
  String addTheNumberDescription = "Номер людини, до якої Ви будете дзвонити за допомогою.";
  String startTimerAgainLabel = "Таймер Було Зупинено";
  String startTimerAgainAction = "Почати";
}

class RussianLanguage implements ILanguageSetting {
  String numberMustBeValid = "Не является номером телефона";
  String numberAlreadyAdded = "Этот номер уже добавлен";
  String mainPhoneNumberLabel = "Основной Телефон Для Звонков";
  String labelError = "Ошибка";
  String stopTheTimerButtonLabel = "Стоп";
  String stopTheTimerAlertTitle = "Остановить Таймер?";
  String stopTheTimerAlertContent = "Вы чувствуете себя лучше?";
  String stopTheTimerAlertActionYes = "Да";
  String stopTheTimerAlertActionNo = "Нет";
  String minutes = "минут";
  String seconds = "секунд";
  String min = "мин";
  String sec = "сек";
  String setTheCallingTimerDescription =
      "Установите таймер звонка.\nОтчет начнется на следующий запуск";
  String loadFilesAccessErrorText =
      "Хозяин, Вы не предоставили мне прав доступа к файлам.\nЯ не смогу сохранить или загрузить эти файлы настроек:\n";
  String settingsNavigationButton = "Настройка";
  String numbersNavigationButton = "Номера Для Звонка";
  String addTheNumberDescription = "Номер человека, которому Вы будете звонить за помощью.";
  String startTimerAgainLabel = "Таймер Было Остановлено";
  String startTimerAgainAction = "Старт";
}

ILanguageSetting get systemLanguage {
  String languageCode = Platform.localeName.split('_')[1];
  print("Language code is $languageCode");
  switch (languageCode) {
    case 'UA':
      return UkranianLanguage();

    case 'DE':
      return GermanLanguage();

    case 'RU':
      return RussianLanguage();

    default:
      return EnglishLanguage();
  }
}
