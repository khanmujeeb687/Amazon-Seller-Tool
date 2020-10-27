import 'dart:io';
import 'dart:math';

import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:juna/logic/AmazoPdf.dart';
import 'package:path_provider/path_provider.dart';

class ExcelUtil{
  var excel;
  Sheet sheetObject;
  List<AmazonPdf> list;

  ExcelUtil(listData){
    this.list=listData;
  }

 Future<String> createExcelFromDate() async {
    excel  = Excel.createExcel();
    sheetObject = excel['AmazonSheet'];
    _addHeading();
    for(int i=0;i<list.length;i++){
      _addARow(list[i]);
    }
    return await _saveToDevice();
  }

  String _getRandomName(){
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
   return String.fromCharCodes(Iterable.generate(5, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  void _addHeading(){
    sheetObject.appendRow([
      "Invoice Number",
      "Invoice Date",
      "Place of supply",
      "Description",
      "Tax Type",
      "Net Amount",
      "Tax amount",
    ]);
  }
  void _addARow(AmazonPdf _data){
    sheetObject.appendRow([
      _data.invoice_number,
      _data.invoice_date,
      _data.place_of_supply,
      _data.description,
      _data.tax_type,
      _data.net_ammount,
      _data.tax_amount,
    ]);
  }


  Future<String> _getDestinationPath()async{
    Directory appDocDir = await getExternalStorageDirectory();
    var dirPath= await new Directory('${appDocDir.path}/juna').create(recursive: true);
    return dirPath.path;
  }

  Future<String> _saveToDevice()async{
    String path=await _getDestinationPath();
    String filename=_getRandomName();
   await excel.encode().then((onValue) {
      File("$path/${filename}.xlsx")
        ..createSync(recursive: true)
        ..writeAsBytesSync(onValue);
    });
    return "$path/${filename}.xlsx";
  }


}