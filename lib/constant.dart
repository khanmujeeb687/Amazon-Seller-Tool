class Constants{
  static const INVOICE_NUMBER='Invoice Number';
  static const INVOICE_DATE='Invoice Date';
  static const PLACE_OF_SUPPLY='Place of delivery';
  static const DESCRIPTION='Tax\nAmount\nTotal\nAmount';
  static const TAX_TYPE='Tax Type';
  static const NET_AMOUNT='Net Amount';
  static const  TAX_AMOUNT='Tax Amount';
  static const  ORDER_NUMBER='Order Number: ';



  //ui
  static const double BUTTON_BORDER_RADIUS=20;




  //
  static const IGST='IGST';

  static const APP_NAME='ExaTool';



  static int getInvoiceNumberStartIndex(String text){
    return text.indexOf(Constants.INVOICE_NUMBER)+17;
  }
  static int getInvoiceNumberEndIndex(String text){
    return text.indexOf(Constants.INVOICE_NUMBER)+23;
  }
}