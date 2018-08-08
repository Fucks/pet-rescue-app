import 'package:flutter/material.dart';
import 'view/login.dart';
import 'view/map.dart';
import 'view/announce.form.dart';

void main() => runApp(new PetRescue());

class PetRescue extends StatelessWidget {
  // Este widget é o container ROOT do aplicativo.
  @override
  Widget build(BuildContext context) => new MaterialApp(
        title: '',
        theme: buildTheme(),
        home: new Login(),
        routes: <String, WidgetBuilder>{
          '/login': (BuildContext context) => new Login(),
//          '/home': (BuildContext context) => new Announces(),
          '/home': (BuildContext context) => new Map(),
          '/form': (BuildContext context) => new AnnounceForm()
        },

      );

  buildTheme() => new ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.deepOrange,
      accentColor: Colors.deepOrangeAccent,
      buttonColor: Colors.deepOrange,
      backgroundColor: Color.fromRGBO(253, 251, 251, 1.0),
      fontFamily: 'Karla');
}
