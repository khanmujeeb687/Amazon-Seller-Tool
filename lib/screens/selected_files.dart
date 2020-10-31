import 'dart:io';

import 'package:flutter/material.dart';
import 'package:juna/values/colors.dart';
import 'package:juna/widgets/bazar_text.dart';
import 'package:juna/widgets/file_item.dart';

class SelectedFiles extends StatefulWidget {
  List<File> files;
  SelectedFiles(this.files);
  @override
  _SelectedFilesState createState() => _SelectedFilesState();
}

class _SelectedFilesState extends State<SelectedFiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: BazarText("Selected files",color: BazarColors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: ListView.separated(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: widget.files.length,
            itemBuilder:
                (BuildContext context, int index) {
              return FileItem(
                clickable: false,
                  file: widget.files[index],
                  selected:[],
                  onclick:(){}
              );
            },
            separatorBuilder:
                (BuildContext context, int index) {
              return Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 1,
                      color: Theme.of(context).dividerColor,
                      width: MediaQuery.of(context)
                          .size
                          .width -
                          70,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
