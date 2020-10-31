

import 'package:flutter/material.dart';
import 'package:juna/components/bazar_text.dart';
import 'package:juna/values/colors.dart';


  AppBar BazarAppBar({String title="",List<Widget> actions,double elevation=10,Widget AppBarBottom,Color bgColor}) {
    return AppBar(
      backgroundColor: bgColor==null?BazarColors.blueshademedium:bgColor,
      elevation: elevation,
      title: BazarText(title,color: BazarColors.white),
      actions: actions==null?[]:actions,
      bottom: PreferredSize(
        preferredSize: AppBarBottom==null?Size.fromHeight(0):Size.fromHeight(50),
        child:  AppBarBottom==null?
            Container(height: 0,width: 0,)
            :AppBarBottom,
      ),
    );
  }


