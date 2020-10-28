import 'package:juna/constant.dart';
import 'package:juna/logic/PdfUtil.dart';

class AmazonPdf{
  String pdfText;

  String invoice_number;
  String invoice_date;
  String place_of_supply;
  String description;
  String _tax_type;
  String net_ammount;
  String tax_amount;
  String IGST="-";
  String CGST="-";
  String SGST="-";
  AmazonPdf(String pdfText){
  this.pdfText=pdfText;
 invoice_number  =  PdfUtil.getInVoiceNumber(pdfText);
 invoice_date  =  PdfUtil.getInvoiceDate(pdfText);
 place_of_supply  =  PdfUtil.getPlaceOfDelivery(pdfText);
 description  =  PdfUtil.getDescription(pdfText);
 _tax_type  =  PdfUtil.getTaxType(pdfText);
 net_ammount  =  PdfUtil.getNetAmount(pdfText);
 tax_amount  =  PdfUtil.getTaxAmount(pdfText);
 _handleTax(_tax_type);
  }

  void _handleTax(String taxtype){
    if(taxtype.contains(Constants.IGST)){
      this.IGST=this.tax_amount;
    }else{
      this.SGST=this.tax_amount;
      this.CGST=this.tax_amount;
    }
  }
}