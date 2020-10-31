import 'package:flutter/material.dart';

import 'colors.dart';


class BazarThemes{

  static final ThemeData LightTheme= new ThemeData(
    primaryColor:BazarColors.blueshademedium,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: BazarColors.white
      )
    ),
    iconTheme: IconThemeData(
      color: BazarColors.white),
    accentColor:BazarColors.blueshademedium,
    scaffoldBackgroundColor:BazarColors.background,
    backgroundColor:BazarColors.background,
  );
}