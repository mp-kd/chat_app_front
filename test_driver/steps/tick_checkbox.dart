import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import '../pages/signup_page.dart';

class TickCheckbox extends When1WithWorld<String, FlutterWorld>{
  @override
  Future<void> executeStep(String input1) async{
    SignUpPage signUpPage = SignUpPage(world.driver);
    await signUpPage.pressSubmitButton();
  }

  @override
  RegExp get pattern => RegExp(r"I tick {string} checkbox");

}