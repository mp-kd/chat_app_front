import 'package:chat_app_front/global_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'locale_model.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GlobalLocalizations.of(context).translate('title')),
      ),
      body: ListView(children: <Widget>[
        Center(
          child: Text(GlobalLocalizations.of(context).translate('Message')),
        ),
        MaterialButton(
          child: Text("Polski"),
          onPressed: () => Provider.of<LocaleModel>(context, listen: false)
              .changeLocale(Locale('pl')),
        ),
        MaterialButton(
          child: Text('English'),
          onPressed: () => Provider.of<LocaleModel>(context, listen: false)
              .changeLocale(Locale('en')),
        ),
        MaterialButton(
          child: Text('Go to auth'),
          onPressed: () => Navigator.of(context).pushReplacementNamed('/auth'),
        )
      ]),
    );
  }
}
