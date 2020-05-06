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
    //TODO: check how to fill worlds using driver
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