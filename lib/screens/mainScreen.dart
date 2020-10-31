import 'dart:io';

import 'package:flutter/material.dart';
import 'package:juna/screens/select_file.dart';
import 'package:juna/util/screen_util.dart';
import 'package:lottie/lottie.dart';
import 'package:open_file/open_file.dart';

import '../logic/amazon_pdf_toexcel_maker.dart';
import '../util/file_utils.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  bool loading = false;
  bool fethching = true;
  String data;
  List<File> _files = [];

  @override
  void initState() {
    getPdfs();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: loading ? Center(
          child:  Container(
              width: ScreenUtil.getScreenWidth(context)/2,
              height: ScreenUtil.getScreenWidth(context)/2,
              child: LottieBuilder.asset("assets/scan.json")),
        ) : Center(
          child: data == null ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              RaisedButton(onPressed: _selectfile,
                child: Text("Select File"),
              )
            ],
          ) : Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListTile(
                  title: Text(data),
                  subtitle: RaisedButton(
                    child: Text("open"),
                    onPressed: () => OpenFile.open(data),
                  )
              )
          ),
        )
    );
  }


  getPdfs() async {
    List<File> files =
    await FileUtils.searchFiles("pdf",showHidden: true);
    _files.addAll(files);
    fethching=false;
  }


  void _selectfile() async {
    if (fethching) return;
    List<File> filePickerResult = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) {
            return PickFile(_files);
          }
      ),
    );
    if(filePickerResult!=null){
      _fetchTextFromPdf(filePickerResult);
    }
  }


  void _fetchTextFromPdf(List<File> files) async{
    setState(() {
      loading=true;
    });
    data=await AmazonExcelExtractor.createExcelFromPdf(files);
    setState(() {
      data=data;
      loading=false;
    });
  }
}
