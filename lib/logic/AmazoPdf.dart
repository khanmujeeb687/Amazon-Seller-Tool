import 'package:juna/constant.dart';
import 'package:juna/logic/PdfUtil.dart';

class AmazonPdf{
  String pdfText;

  String invoice_number;
  String order_number;
  String invoice_date;
  String place_of_supply;
  String description;
  String _tax_type;
  String net_ammount;
  String tax_amount;
  String IGST="0.00";
  String CGST="0.00";
  String SGST="0.00";
  String SKU="";
  String total_value;
  AmazonPdf(String pdfText){
  this.pdfText=pdfText;
 invoice_number  =  PdfUtil.getInVoiceNumber(pdfText);
 invoice_date  =  PdfUtil.getInvoiceDate(pdfText);
 order_number  =  PdfUtil.getOrderNumber(pdfText);
 place_of_supply  =  PdfUtil.getPlaceOfDelivery(pdfText);
 SKU  =  PdfUtil.getSKU(pdfText);
 description  =  PdfUtil.getDescription(pdfText);
 _tax_type  =  PdfUtil.getTaxType(pdfText);
 net_ammount  =  PdfUtil.getNetAmount(pdfText);
 tax_amount  =  PdfUtil.getTaxAmount(pdfText);
 _handleTax(_tax_type);
  total_value = (double.parse(net_ammount)+double.parse(tax_amount)).toString();
  }

  void _handleTax(String taxtype){
    if(taxtype.contains(Constants.IGST)){
      this.IGST=this.tax_amount;
    }else{
      this.SGST=this.tax_amount;
      this.CGST=this.tax_amount;
      this.tax_amount=(double.parse(tax_amount.replaceAll(" ", ""))*2).toString();
    }
  }
}