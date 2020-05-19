abstract class ILanguageSetting {
  String numberMustBeValid;
  String numberAlreadyAdded;
}

class EnglishLanguage implements ILanguageSetting {
  String numberMustBeValid = 'Number must to be valid';
  String numberAlreadyAdded = "You already added this number";
}
