import 'package:flutter/material.dart';

class Temp extends StatefulWidget {
  String text;
  Temp(this.text);
  @override
  _TempState createState() => _TempState();
}

class _TempState extends State<Temp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Text(widget.text),
        ),
      )
    );
  }
}
