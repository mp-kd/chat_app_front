import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import '../pages/signup_page.dart';

class FillWith extends When2WithWorld<String, String, FlutterWorld>{


  @override
  RegExp get pattern => RegExp(r"I fill {string} with {string}");

  @override
  Future<void> executeStep(String input1, String input2) async {
    SignUpPage signUpPage = SignUpPage(world.driver);
    await signUpPage.fillWithWorld(input1, input2);
  }

}