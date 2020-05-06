import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';

class SignUpPage{
  final txtFormUsername = find.byValueKey("usernameSignUpText");
  final txtFormEmail = find.byValueKey('emailSignUpTextForm');
  final txtFormPassword = find.byValueKey('passwordSignUpTextForm');
  final txtFormRepeatedPassword = find.byValueKey('repeatedPasswordSignUpTextForm');
  final btnSubmit = find.byValueKey('submitSignUpButton');
  final chkboxTermsOfService = find.byValueKey('termsOfServiceCheckbox');
  final confirmAlert = find.byValueKey('confirmSignUpAlert');

  FlutterDriver _driver;

  SignUpPage(FlutterDriver driver){
    this._driver = driver;
  }

  fillWithWorld(String input1, String input2) async{
    switch(input1){
      case "usernamefield":{
        await FlutterDriverUtils.enterText(_driver, txtFormUsername, input2);
      }
      break;
      case "emailfield":{
        await FlutterDriverUtils.enterText(_driver, txtFormEmail, input2);
      }
      break;
      case "passwordfield":{
        await FlutterDriverUtils.enterText(_driver, txtFormPassword, input2);
      }
      break;
      case "repeatpasswordfield":{
        await FlutterDriverUtils.enterText(_driver, txtFormRepeatedPassword, input2);
      }
      break;
      default:{
        //TODO: throw some error or smh
        print("notfound field");
      }
      break;
    }
  }

  tickTermsOfServiceCheckbox() async{
    await _driver.tap(chkboxTermsOfService);
  }

  pressSubmitButton() async{
    await _driver.tap(btnSubmit);
  }

  isPresentSignUpForm() async{
    await FlutterDriverUtils.isPresent(txtFormEmail, _driver);
    await FlutterDriverUtils.isPresent(txtFormPassword, _driver);
    await FlutterDriverUtils.isPresent(txtFormRepeatedPassword, _driver);
    await FlutterDriverUtils.isPresent(txtFormUsername, _driver);
    await FlutterDriverUtils.isPresent(btnSubmit, _driver);
    await FlutterDriverUtils.isPresent(chkboxTermsOfService, _driver);
  }

  isPresentSignUpConfirmAlert() async{
    await FlutterDriverUtils.isPresent(confirmAlert, _driver);
  }
}