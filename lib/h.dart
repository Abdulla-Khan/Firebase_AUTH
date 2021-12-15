import 'package:flutter/material.dart';

class ing extends StatefulWidget {
  const ing({Key? key}) : super(key: key);

  @override
  _ingState createState() => _ingState();
}

class _ingState extends State<ing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'login',
        style: TextStyle(fontSize: 43),
      )),
    );
  }
}
