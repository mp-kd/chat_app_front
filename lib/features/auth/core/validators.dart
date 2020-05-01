
class EmailValidator{
  static String EMAIL_CANT_BE_EMPTY = "Email can't be empty";
  static String EMAIL_INVALID_FORMAT = "Invalid format";
  
  static String validate(String value){
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if(value.isEmpty)
      return EMAIL_CANT_BE_EMPTY;
    if(!regex.hasMatch(value))
      return EMAIL_INVALID_FORMAT;
    return null;
  }
}

