import 'package:flutter/material.dart';

class Loading extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

}