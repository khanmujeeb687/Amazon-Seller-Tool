
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:juna/values/colors.dart';

import '../constant.dart';
import 'bazar_text.dart';


Widget BazarSquareButton(text,{VoidCallback onClick,Color bgcolor,Color textcolor=BazarColors.white}){
  return RaisedButton(
    child: BazarText(text,color: textcolor),
    onPressed: onClick,
    color: bgcolor==null?BazarColors.pink:bgcolor,
  );
}

Widget BazarRoundedButton(text,{VoidCallback onClick,Color bgcolor,Color textcolor=BazarColors.white}){
  return RaisedButton(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Constants.BUTTON_BORDER_RADIUS)
    ),
    child: BazarText(text,color: textcolor),
    onPressed: onClick,
    color: bgcolor==null?BazarColors.pink:bgcolor,
  );
}

showIToast(text,{Color color=Colors.grey,ToastGravity toastGravity=ToastGravity.TOP}){
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: toastGravity,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
  );}