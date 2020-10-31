import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:juna/values/colors.dart';


Widget BazarText(text,{Color color,double fontsize=15,FontWeight fontWeight=FontWeight.normal}){
  return Text(text,style: GoogleFonts.muli(color:color==null?BazarColors.black:color,fontSize: fontsize,fontWeight: fontWeight),);
}