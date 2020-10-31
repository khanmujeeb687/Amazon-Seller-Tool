import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:juna/values/colors.dart';

import '../constant.dart';

class Styles{
  static InputStyle({String label="",String hint="",Widget suffix}){
    return InputDecoration(
      contentPadding: EdgeInsets.all(18),
      counterText: "",
      hintText: hint,
      hintStyle:GoogleFonts.muli(fontSize: 13) ,
      labelText: label,
      labelStyle: GoogleFonts.muli(fontSize: 13),
      suffix: suffix,
      border: new OutlineInputBorder(
        gapPadding: 7,
        borderSide: BorderSide.none,
        borderRadius: new BorderRadius.circular(5),
      ),
    );
  }

  static SimpleInputStyle({String label="",String hint="",Widget suffix,Widget prefix}){
    return InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(2,9,2,12),
      counterText: "",
      hintText: hint,
      prefix:prefix,
      hintStyle:GoogleFonts.muli(fontSize: 13) ,
      labelText: label,
      labelStyle: GoogleFonts.muli(fontSize: 13),
      suffix: suffix,
    );
  }

  static InputBoxDecoration(){
    return BoxDecoration(
      borderRadius: BorderRadius.circular(Constants.BUTTON_BORDER_RADIUS),
      color: BazarColors.lightgrey
    );
  }


  static SuggestionBoxDecoration(){
//    return SuggestionsBoxDecoration(
//        shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.circular(15)
//        )
//    );
  }
}