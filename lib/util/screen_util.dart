import 'package:flutter/cupertino.dart';

class ScreenUtil{
  static getScreenWidth(context){
    return MediaQuery.of(context).size.width;
  }

  static getScreenHeight(context){
    return MediaQuery.of(context).size.height;
  }
}