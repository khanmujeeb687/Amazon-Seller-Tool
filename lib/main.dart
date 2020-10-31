import 'package:flutter/material.dart';
import 'package:juna/splash.dart';
import 'package:juna/values/themes.dart';


void main() {
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      theme: BazarThemes.LightTheme,
      title:"Juna"
    )
  );
}
