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
  List<String> setTheCallingTimerDescription;
  String noCallingPermissionError;
  String loadFilesAccessErrorText;
  String settingsNavigationButton;
  String numbersNavigationButton;
  String addTheNumberDescription;
  String startTimerAgainLabel;
  String startTimerAgainAction;
  String noNumbersAdded;
  String fromContacts;
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
  List<String> setTheCallingTimerDescription = [
    "Set",
    "the Calling timer",
    "Next time",
    "you run the app, it starts",
    "The",
    "first call",
    "will need to be confirmed"
  ];
  String loadFilesAccessErrorText =
      "My Lord, you did not grant me access to a storage.\nI can't save or load these config files:\n";
  String noCallingPermissionError =
      "My Lord, you did not grant me access to the phone calls.\nAs a proud Call Timer, I can't work without that permission.";
  String settingsNavigationButton = "Settings";
  String numbersNavigationButton = "Numbers To Call";
  String addTheNumberDescription =
      "The number of the person you will calling for a help.";
  String startTimerAgainLabel = "Timer Was Stopped";
  String startTimerAgainAction = "Start Again";
  String noNumbersAdded = "At least one number must exist.";
  String fromContacts = "from contacts";
}

// @TODO
class GermanLanguage implements ILanguageSetting {
  String numberMustBeValid = "Die Nummer muss gültig sein";
  String numberAlreadyAdded = "Diese Nummer bereits hinzugefügt";
  String mainPhoneNumberLabel = "Telefonnummer zum Anrufen";
  String labelError = "Error";
  String stopTheTimerButtonLabel = "Stopp";
  String stopTheTimerAlertTitle = "Timer stoppen?";
  String stopTheTimerAlertContent = "Bist du in Ordnung?";
  String stopTheTimerAlertActionYes = "Ja";
  String stopTheTimerAlertActionNo = "Nein";
  String minutes = "Minuten";
  String seconds = "Sekunden";
  String min = "min";
  String sec = "sek";
  List<String> setTheCallingTimerDescription = [
    "Stellen",
    "den Anruf-Timer ein",
    "Nächstes Mal",
    "wenn Sie die App ausführen, wird sie gestartet",
    "Der",
    "erste Anruf",
    "muss bestätigt werden"
  ];
  String loadFilesAccessErrorText =
      "Mein Herr, du hast mir keinen Zugang zu einem Speicher gewährt.\nIch kann diese Konfigurationsdateien nicht speichern oder laden:\n";
  String noCallingPermissionError =
      "Mein Herr, Sie haben mir keinen Zugang zu den Telefonanrufen gewährt.\nAls stolzer Anruf-Timer kann ich ohne diese Erlaubnis nicht arbeiten.";
  String settingsNavigationButton = "Konfigurieren";
  String numbersNavigationButton = "Zu rufende Nummern";
  String addTheNumberDescription =
      "Die Nummer der Person, die Sie für eine Hilfe rufen werden.";
  String startTimerAgainLabel = "Timer gestoppt";
  String startTimerAgainAction = "Von vorn anfangen";
  String noNumbersAdded = "Es muss mindestens eine Nummer vorhanden sein.";
  String fromContacts = "von Kontakten";
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
  List<String> setTheCallingTimerDescription = [
    "Встановіть",
    "таймер дзвінку",
    "Під час наступного запуску",
    "відлік почнеться",
    "",
    "Перший дзвінок",
    "необхідно буде підтвердити"
  ];
  String loadFilesAccessErrorText =
      "Господарю, Ви не надали мені прав доступу до файлів.\nЯ не зможу зберегти або завантажити ці файли налаштувань:\n";
  String noCallingPermissionError =
      "Господарю, Ви не надали мені прав доступу на дзвінки.\nЯ, як таймер дзвінку, не зможу працювати без цього дозволу.";
  String settingsNavigationButton = "Налаштування";
  String numbersNavigationButton = "Номери Для Дзвінка";
  String addTheNumberDescription =
      "Номер людини, до якої Ви будете дзвонити за допомогою.";
  String startTimerAgainLabel = "Таймер Було Зупинено";
  String startTimerAgainAction = "Почати";
  String noNumbersAdded = "Додайте хоча б один номер.";
  String fromContacts = "з контактів";
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
  List<String> setTheCallingTimerDescription = [
    "Установите",
    "таймер звонка",
    "На следующий запуск",
    "отчет начнется",
    "",
    "Первый звонок",
    "необходимо будет подтвердить"
  ];
  String loadFilesAccessErrorText =
      "Хозяин, Вы не предоставили мне прав доступа к файлам.\nЯ не смогу сохранить или загрузить эти файлы настроек:\n";
  String noCallingPermissionError =
      "Хозяин, Вы не предоставили мне права сделать звонок.\nЯ, как таймер звонка, не смогу работать без этого разрешения.";
  String settingsNavigationButton = "Настройка";
  String numbersNavigationButton = "Номера Для Звонка";
  String addTheNumberDescription =
      "Номер человека, которому Вы будете звонить за помощью.";
  String startTimerAgainLabel = "Таймер Было Остановлено";
  String startTimerAgainAction = "Старт";
  String noNumbersAdded = "Добавьте хотя бы один номер.";
  String fromContacts = "с контактов";
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
