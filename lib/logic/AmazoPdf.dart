import 'package:juna/logic/PdfUtil.dart';

class AmazonPdf{
  String pdfText;

  String invoice_number;
  String invoice_date;
  String place_of_supply;
  String description;
  String tax_type;
  String net_ammount;
  String tax_amount;
  AmazonPdf(String pdfText){
  this.pdfText=pdfText;
 invoice_number  =  PdfUtil.getInVoiceNumber(pdfText);
 invoice_date  =  PdfUtil.getInvoiceDate(pdfText);
 place_of_supply  =  PdfUtil.getPlaceOfDelivery(pdfText);
 description  =  PdfUtil.getDescription(pdfText);
 tax_type  =  PdfUtil.getTaxType(pdfText);
 net_ammount  =  PdfUtil.getNetAmount(pdfText);
 tax_amount  =  PdfUtil.getTaxAmount(pdfText);
  }
}