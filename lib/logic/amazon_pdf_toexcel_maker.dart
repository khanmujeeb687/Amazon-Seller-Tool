import 'dart:io';

import 'package:juna/logic/AmazoPdf.dart';
import 'package:juna/logic/ExcelUtil.dart';
import 'package:pdf_text/pdf_text.dart';

class AmazonExcelExtractor{

  static Future<String> createExcelFromPdf(List<File> filePath)async{
    List<AmazonPdf> list=[];
    List<String> Invoices=[];
    for(int j=0;j<filePath.length;j++){
      PDFDoc doc = await PDFDoc.fromPath(filePath[j].path,fastInit: true);
      for(int i=2;i<=doc.pages.length;i=i+2){
        PDFPage page = doc.pageAt(i);
        AmazonPdf amz=AmazonPdf(await page.text);
        if(amz!=null){
          if(Invoices.contains(amz.invoice_number)) continue;
          list.add(amz);
          Invoices.add(amz.invoice_number);
        }
      }
    }

    ExcelUtil excelUtil=new ExcelUtil(list);
   return excelUtil.createExcelFromDate();
  }
}