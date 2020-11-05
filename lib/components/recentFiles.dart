
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:juna/util/user.dart';

import 'bazar_text.dart';
import 'file_item.dart';

class RecentFiles extends StatelessWidget {
  List<dynamic> _dataBase;
  RecentFiles(this._dataBase);
  @override
  Widget build(BuildContext context) {
    if(_dataBase.isEmpty){
      return Center(
        child:BazarText("No recent files!",fontsize: 25),
      );
    }
    return Column(
      children: [
        SizedBox(height: 9,),
        Align(
            alignment: Alignment.centerLeft,
            child: BazarText("Recent files",fontsize: 20)),
        SizedBox(height: 9,),
        ...List.generate(_dataBase.length,(index){
          MyFileDataBase dataItem=MyFileDataBase.fromMap(_dataBase[index]);
          return  FileItem(file: File(dataItem.path));
        })
      ],
    );
  }
}
