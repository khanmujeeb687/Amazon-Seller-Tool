import 'package:juna/constant.dart';

class PdfUtil{
  static String getInVoiceNumber(String text){
    return text.substring(
    text.indexOf(Constants.INVOICE_NUMBER)+Constants.INVOICE_NUMBER.length+2,
    text.indexOf(Constants.INVOICE_NUMBER)+Constants.INVOICE_NUMBER.length+9,
    ).replaceAll(" ", "");
  }
  static String getInvoiceDate(String text){
    return text.substring(
      text.indexOf(Constants.INVOICE_DATE)+Constants.INVOICE_DATE.length+2,
      text.indexOf(Constants.INVOICE_DATE)+Constants.INVOICE_DATE.length+13,
    ).replaceAll(" ", "");
  }
  static String getOrderNumber(String text){
    String a= text.substring(text.indexOf(Constants.ORDER_NUMBER)+Constants.ORDER_NUMBER.length);
    a = a[0]==' '?a.substring(1):a;
    a=a.substring(0,a.indexOf(" "));
    return a;
  }
static String getPlaceOfDelivery(String text){
  String first = text.substring(text.indexOf(Constants.PLACE_OF_SUPPLY)+Constants.PLACE_OF_SUPPLY.length+1).trim();
//  first=first.substring(0,first.indexOf(Constants.INVOICE_NUMBER));
  return first;
  }
  static String getDescription(String text){
    String first=text.substring(text.indexOf(Constants.DESCRIPTION)+Constants.DESCRIPTION.length+2);
   return first.substring(0,first.indexOf("₹"));
  }


  static String getTaxType(String text){
  String first=text.substring(text.indexOf(Constants.DESCRIPTION)+Constants.DESCRIPTION.length+2);
  first=first.substring(first.indexOf("₹")+1);
  return first.substring(first.indexOf("%")+2,first.indexOf("%")+6);
  }

  static String getNetAmount(String text){
  String first=text.substring(text.indexOf(Constants.DESCRIPTION)+Constants.DESCRIPTION.length+2);
  first=first.substring(first.indexOf("₹")+1);
  first=first.substring(first.indexOf("₹")+1);
  if(text.contains("Unit\nPrice\nDiscount")){
    first=first.substring(first.indexOf("₹")+1);
  }
  return first.substring(0,first.indexOf(".")+3);
  }


  static String getTaxAmount(String text){
  String first=text.substring(text.indexOf(Constants.DESCRIPTION)+Constants.DESCRIPTION.length+2);
  first=first.substring(first.indexOf("₹")+1);
  first=first.substring(first.indexOf("₹")+1);
  first=first.substring(first.indexOf("₹")+1);
  if(text.contains("Unit\nPrice\nDiscount")){
    first=first.substring(first.indexOf("₹")+1);
  }
  return first.substring(0,first.indexOf(".")+3);
}


}