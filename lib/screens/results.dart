import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:juna/components/BazarComponents.dart';
import 'package:juna/components/appbar.dart';
import 'package:juna/components/bazar_text.dart';
import 'package:juna/components/file_item.dart';
import 'package:juna/components/recentFiles.dart';
import 'package:juna/util/databasehelper.dart';
import 'package:juna/util/file_utils.dart';
import 'package:juna/util/user.dart';
import 'package:juna/values/colors.dart';
import 'package:juna/values/themes.dart';
import 'package:open_file/open_file.dart';

class Results extends StatefulWidget {
  String data;
  Results(this.data);
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {

  List<dynamic> _dataBase=[];

  @override
  void initState() {
    _savetoDataBase();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 7),
                alignment: Alignment.bottomLeft,
                height: 100,
                child: BazarText('File is ready',fontsize: 25),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(Icons.check,color: Colors.green,size:30,),
                    title: BazarText(FileUtils.baseName(widget.data)),
                    subtitle: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        BazarRoundedButton("Open",onClick: ()=>OpenFile.open(widget.data)),
                        SizedBox(width: 15,),
                        BazarRoundedButton("Share",onClick: (){
                          FlutterShare.shareFile(
                            title: FileUtils.baseName(widget.data),
                            text: 'File Created from ExaTool',
                            filePath: widget.data,
                          );
                        },bgcolor: BazarColors.blue),

                      ],
                    ),
                  ),
                )
              ),
             RecentFiles(_dataBase)
            ],
          ),
        ),
      ),
    );
  }

  void _savetoDataBase() async{
    var db=new databasehelper();
    db.insertuser(MyFileDataBase(widget.data));
    var a=await db.AllUsers();
    if(a!=null){
      setState(() {
        _dataBase.addAll(a);
      });
    }
  }
}
