import 'package:flutter/material.dart';
import 'package:juna/values/themes.dart';

import 'screens/Home.dart';

void main() {
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: BazarThemes.LightTheme,
      title:"Juna"
    )
  );
}
