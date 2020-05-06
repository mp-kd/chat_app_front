import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import '../pages/signup_page.dart';

class NotLoggedIn extends GivenWithWorld<FlutterWorld>{
  @override
  Future<void> executeStep() async{
    //TODO: check if user is not logged in
  }

  @override
  RegExp get pattern => RegExp(r"I am not currently logged in");

}