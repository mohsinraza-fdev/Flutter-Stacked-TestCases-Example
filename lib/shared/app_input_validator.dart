import 'app_input_validation_result.dart';

class AppInputValidator {
  static String? validateEmail(String email) {
    if (!AppInputValidationResult.isValidEmail(email)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (!AppInputValidationResult.isValidPasswordLength(password)) {
      return "Password should be atleast 8 characters long";
    }
    if (!AppInputValidationResult.isValidPasswordAlphabet(password)) {
      return "Password must contain atleast 1 Uppercase letter";
    }
    if (!AppInputValidationResult.isValidPasswordNumbers(password)) {
      return "Password must contain atleast 1 Number";
    }
    if (!AppInputValidationResult.isValidPasswordSpecialCharacters(password)) {
      return "Password must contain atleast 1 Special Character";
    }
    return null;
  }

  static String? validateFirstName(String name) {
    if (!AppInputValidationResult.isValidNameLength(name)) {
      return "Please enter a valid first name";
    }
    if (!AppInputValidationResult.isValidNameCharacters(name)) {
      return "Name can only contain alphabets";
    }
    return null;
  }

  static String? validateLastName(String name) {
    if (!AppInputValidationResult.isValidNameLength(name)) {
      return "Please enter a valid last name";
    }
    if (!AppInputValidationResult.isValidNameCharacters(name)) {
      return "Name can only contain alphabets";
    }
    return null;
  }
}
