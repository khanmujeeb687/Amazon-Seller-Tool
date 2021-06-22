import 'package:juna/constant.dart';

class PdfUtil{
  static String getInVoiceNumber(String text){
    return text.substring(
    text.indexOf(Constants.INVOICE_NUMBER)+Constants.INVOICE_NUMBER.length+3,
    text.indexOf(Constants.INVOICE_NUMBER)+Constants.INVOICE_NUMBER.length+9,
    );
  }
  static String getInvoiceDate(String text){
    return text.substring(
      text.indexOf(Constants.INVOICE_DATE)+Constants.INVOICE_DATE.length+3,
      text.indexOf(Constants.INVOICE_DATE)+Constants.INVOICE_DATE.length+13,
    );
  }
  static String getOrderNumber(String text){
    String a= text.substring(text.indexOf(Constants.ORDER_NUMBER)+Constants.ORDER_NUMBER.length);
    a=a.substring(0,a.indexOf(" "));
    return a;
  }
static String getPlaceOfDelivery(String text){
  String first = text.substring(text.indexOf(Constants.PLACE_OF_SUPPLY)+Constants.PLACE_OF_SUPPLY.length+2);
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