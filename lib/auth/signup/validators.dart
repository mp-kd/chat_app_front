class EmailValidator{
  static final String emailCantBeEmpty = "Email can't be empty";
  static final String emailInvalidFormat = "Invalid format";

  static String validate(String value){
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if(value.isEmpty)
      return emailCantBeEmpty;
    if(!regex.hasMatch(value))
      return emailInvalidFormat;
    return null;
  }
}

class PasswordValidator{
  static final String passwordCantBeEmpty = "Password can't be empty";
  static final String passwordInvalidFormat = "Your password is not strong enough. Please reenter.";

  static String validate(String value){
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    if(value.isEmpty){
      return passwordCantBeEmpty;
    }
    if(!regExp.hasMatch(value)){
      return passwordInvalidFormat;
    }
    return null;
  }
}