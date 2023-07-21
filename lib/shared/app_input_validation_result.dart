class AppInputValidationResult {
  static bool isValidEmail(String email) {
    if (!(RegExp(r'^(([a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)*(_*)@){1})[a-zA-Z0-9]+((\.[a-z]{2,})+)$').hasMatch(email))) {
      return false;
    }
    return true;
  }

  static bool isValidPasswordLength(String password) {
    if (password.length < 8) {
      return false;
    }
    return true;
  }

  static bool isValidPasswordAlphabet(String password) {
    if (!(RegExp(r'(?=.*[A-Z]).*').hasMatch(password))) {
      return false;
    }
    return true;
  }

  static bool isValidPasswordNumbers(String password) {
    if (!(RegExp(r'(?=.*\d).*').hasMatch(password))) {
      return false;
    }
    return true;
  }

  static bool isValidPasswordSpecialCharacters(String password) {
    if (!(RegExp(r'(?=.*[@$!%*?&#^\+=\(\)_-]).*').hasMatch(password))) {
      return false;
    }
    return true;
  }

  static bool isValidNameLength(String name) {
    if (name.length < 2) {
      return false;
    }
    return true;
  }

  static bool isValidNameCharacters(String name) {
    if (RegExp(r'[0-9]').hasMatch(name)) {
      return false;
    }
    return true;
  }
}
