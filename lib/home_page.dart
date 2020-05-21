import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'localization/global_localization.dart';
import 'localization/locale_model.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GlobalLocalizations.of(context).chatApp),
      ),
      body: Column(
        children: <Widget>[
          MaterialButton(
            child: Text('Polski'),
            onPressed: ()=>Provider.of<LocaleModel>(context, listen: false).changeLocale(Locale('pl')),
          ),
          MaterialButton(
            child: Text('English'),
            onPressed: ()=>Provider.of<LocaleModel>(context, listen: false).changeLocale(Locale('en')),
          ),
        ],
      ),
    );
  }
}
