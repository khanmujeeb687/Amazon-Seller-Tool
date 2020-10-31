import 'package:flutter/material.dart';
import 'package:juna/util/screen_util.dart';
import 'package:juna/values/colors.dart';

import 'BazarComponents.dart';
import 'bazar_text.dart';


class BazarAlertDialog extends StatelessWidget {
  String headerTitle;
  String buttonText;
  String content;
  IconData icon;

  BazarAlertDialog({this.icon=Icons.home,this.buttonText="",this.content="",this.headerTitle=""});
  @override
  Widget build(BuildContext context) {
    double width=ScreenUtil.getScreenWidth(context);
    double height=ScreenUtil.getScreenHeight(context);
    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      titlePadding: EdgeInsets.all(0),
      title: Container(
        alignment: Alignment.center,
        width: width/2,
        height: width*.35,
        color: BazarColors.pink,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon,size: 60,color: BazarColors.white,),
            BazarText(headerTitle,color: BazarColors.white,fontWeight: FontWeight.bold)
          ],
        ),
      ),
      content: Container(
        alignment: Alignment.center,
        width: width/2,
        height: width*.35,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
                padding: EdgeInsets.all(10),
                child: BazarText(content,color: BazarColors.grey)),
            BazarRoundedButton(buttonText,onClick: (){
              Navigator.pop(context,true);
            })
          ],
        ),
      ),
    );
  }
}
