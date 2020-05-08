class EmailValidator {
  static final String emailCantBeEmpty = "E-mail can't be empty";
  static final String emailInvalidFormat = "Invalid e-mail format";
  static final Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static String validate(String value) {
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty) return emailCantBeEmpty;
    if (!regex.hasMatch(value)) return emailInvalidFormat;
    return null;
  }
}

class PasswordValidator {
  static final String passwordCantBeEmpty = "Password can't be empty";
  static final String passwordInvalidFormat =
      "Password should containt at least 1 lower case, 1 upper case, 1 number, 1 special character ( ! @ # \$ & * ~ )";

  static final Pattern pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  static String validate(String value) {
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return passwordCantBeEmpty;
    }
    if (!regExp.hasMatch(value)) {
      return passwordInvalidFormat;
    }
    return null;
  }
}

class UsernameValidator {
  static final String usernameCantBeEmpty = "Username can't be empty";
  static final String usernameInvalidFormat = "Invalid name format";

  static String validate(String value) {
    //TODO: some proper username validation
    if (value.isEmpty) return usernameCantBeEmpty;
    if (value.length > 32 || value.length < 6) return usernameInvalidFormat;
    return null;
  }
}
