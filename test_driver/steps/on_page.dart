import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import '../pages/signup_page.dart';

class OnPage extends Given1WithWorld<String, FlutterWorld>{
  @override
  Future<void> executeStep(String input1) async{
    //TODO: check if proper route is setted up
  }

  @override
  RegExp get pattern => RegExp(r"I am on {string} page");

}