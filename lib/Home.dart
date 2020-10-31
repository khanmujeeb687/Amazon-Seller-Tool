import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:juna/components/BazarComponents.dart';
import 'package:juna/logic/AmazoPdf.dart';
import 'package:juna/logic/ExcelUtil.dart';
import 'package:juna/logic/amazon_pdf_toexcel_maker.dart';
import 'package:juna/util/screen_util.dart';
import 'package:juna/values/assets.dart';
import 'package:lottie/lottie.dart';
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
        child: Lottie.asset(Assets.LoadingAnimation),
      ):Container(
        padding: EdgeInsets.all(15),
        width: ScreenUtil.getScreenWidth(context),
        height: ScreenUtil.getScreenHeight(context),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                width: ScreenUtil.getScreenWidth(context),
                child: BazarRoundedButton("Convert a pdf",onClick: _selectfile))
          ],
        ),
      )
    );
  }

  void _selectfile() async{
    //TODO
    List<File> filePickerResult=await FilePicker.getMultiFile(type: FileType.custom,allowedExtensions: ['pdf']);
    if(filePickerResult!=null){
      _fetchTextFromPdf(filePickerResult);
    }
  }



  void _fetchTextFromPdf(List<File> filePath) async{
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
