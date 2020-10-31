import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationUtil{
 static Future<dynamic> navigate(BuildContext context,Widget destination){
   return Navigator.push(
       context, MaterialPageRoute(builder: (context){
      return destination;
    },
   )
   );
  }
}