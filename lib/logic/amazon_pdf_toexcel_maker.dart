import 'dart:io';

import 'package:juna/logic/AmazoPdf.dart';
import 'package:juna/logic/ExcelUtil.dart';
import 'package:pdf_text/pdf_text.dart';

class AmazonExcelExtractor{

  static Future<String> createExcelFromPdf(String filePath)async{
    List<AmazonPdf> list=[];
    PDFDoc doc = await PDFDoc.fromPath(filePath,fastInit: true);
    for(int i=2;i<=doc.pages.length;i=i+2){
      PDFPage page = doc.pageAt(i);
      list.add(AmazonPdf(await page.text));
    }
    ExcelUtil excelUtil=new ExcelUtil(list);
   return excelUtil.createExcelFromDate();
  }
}