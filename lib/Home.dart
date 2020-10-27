import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:juna/logic/AmazoPdf.dart';
import 'package:juna/logic/ExcelUtil.dart';
import 'package:juna/logic/amazon_pdf_toexcel_maker.dart';
import 'package:open_file/open_file.dart';
import 'file:///G:/AndroidStudioProjects/bazar/juna/lib/logic/PdfUtil.dart';
import 'package:pdf_text/pdf_text.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File file;
  bool loading=false;
  String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading?Center(
        child: CircularProgressIndicator(),
      ):Center(
        child:data==null? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            RaisedButton(onPressed: _selectfile,
            child: Text("Select File"),
            )
          ],
        ):Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListTile(
              title: Text(data),
            subtitle: RaisedButton(
            child: Text("open"),
              onPressed: ()=>OpenFile.open(data),
          )
              )
        ),
      )
    );
  }

  void _selectfile() async{
    //TODO
    FilePickerResult filePickerResult=await FilePicker.platform.pickFiles(allowMultiple:true,type: FileType.custom,allowedExtensions: ['pdf']);
    if(filePickerResult!=null){
      _fetchTextFromPdf(filePickerResult.files.first.path);
    }
  }



  void _fetchTextFromPdf(String filePath) async{
    setState(() {
      loading=true;
    });
    data=await AmazonExcelExtractor.createExcelFromPdf(filePath);
    setState(() {
      data=data;
      loading=false;
    });
  }
}
