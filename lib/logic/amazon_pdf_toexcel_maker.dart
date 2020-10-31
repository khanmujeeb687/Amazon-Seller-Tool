import 'dart:io';

import 'package:juna/logic/AmazoPdf.dart';
import 'package:juna/logic/ExcelUtil.dart';
import 'package:pdf_text/pdf_text.dart';

class AmazonExcelExtractor{

  static Future<String> createExcelFromPdf(List<File> files)async{
    List<AmazonPdf> list=[];
    List<String> Invoices=[];
    for(int j=0;j<files.length;j++){
      PDFDoc doc = await PDFDoc.fromPath(files[j].path,fastInit: true);
      for(int i=2;i<=doc.pages.length;i=i+2){
        PDFPage page = doc.pageAt(i);
        AmazonPdf temp=AmazonPdf(await page.text);
        if(temp==null) continue;
        if(!Invoices.contains(temp.invoice_number)){
          Invoices.add(temp.invoice_number);
          list.add(temp);
        }
      }
    }
    ExcelUtil excelUtil=new ExcelUtil(list);
   return excelUtil.createExcelFromDate();
  }
}