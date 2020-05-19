abstract class ILanguageSetting {
  String numberMustBeValid;
  String numberAlreadyAdded;

  String setTheCallingTimerDescription;
}

class EnglishLanguage implements ILanguageSetting {
  String numberMustBeValid = 'Number must to be valid';
  String numberAlreadyAdded = "You already added this number";

  String setTheCallingTimerDescription =
      "Set the Calling timer. Next time you run the app, it starts.";
}

class GermanLanguage implements ILanguageSetting {
  String numberMustBeValid = 'Die Nummer muss gültig sein';
  String numberAlreadyAdded = "Sie haben diese Nummer bereits hinzugefügt";

  String setTheCallingTimerDescription =
      "Stellen Sie den Anruf-Timer ein. Wenn Sie die App das nächste Mal ausführen, wird sie gestartet.";
}

class UkranianLanguage implements ILanguageSetting {
  String numberMustBeValid = "Не є номером телефону";
  String numberAlreadyAdded = "Цей номер вже додано";

  String setTheCallingTimerDescription =
      "Встановіть таймер дзвінку. У наступний запуск, відлік почнеться.";
}

class RussianLanguage implements ILanguageSetting {
  String numberMustBeValid = "Не является номером телефона";
  String numberAlreadyAdded = "Этот номер уже добавлен";

  String setTheCallingTimerDescription =
      "Установите таймер звонка. Отчет начнется на следующий запуск";
}
