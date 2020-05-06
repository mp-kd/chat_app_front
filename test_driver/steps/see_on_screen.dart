import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import '../pages/signup_page.dart';

class SeeOnScreen extends When1WithWorld<String, FlutterWorld>{
  @override
  Future<void> executeStep(String input1) async{
    SignUpPage signUpPage = SignUpPage(world.driver);
    switch(input1){
      case "signupform":{
          await signUpPage.isPresentSignUpForm();

        }
      break;
      case "signupconfirmationalert":{
        await signUpPage.isPresentSignUpConfirmAlert();
      }
      break;
      default:{
        //TODO: throw some exception or write proper factory
        print("not found");
      }
      break;
    }
  }

  @override
  RegExp get pattern => RegExp(r"I see {string} on screen");

}