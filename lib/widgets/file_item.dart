import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:juna/util/file_utils.dart';
import 'package:juna/values/colors.dart';
import 'package:lottie/lottie.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';

import 'file_popup.dart';

class FileItem extends StatefulWidget {
  final FileSystemEntity file;
  final Function popTap;
  List<File> selected;
  VoidCallback onclick;
  bool clickable;

  FileItem({
    Key key,
    @required this.file,
    this.popTap,
    this.selected,
    this.onclick,
    this.clickable=true
  }) : super(key: key);

  @override
  _FileItemState createState() => _FileItemState();
}

class _FileItemState extends State<FileItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: widget.clickable,
      selected: widget.selected.contains(widget.file),
      selectedTileColor: BazarColors.lightgrey,
      onTap: (){
        if(!widget.selected.contains(widget.file)){
          widget.selected.add(widget.file);
        }else{
          widget.selected.remove(widget.file);
        }
        widget.onclick();
        setState(() {});
      },
      contentPadding: EdgeInsets.all(0),
      leading: Icon(Feather.file_text,color: Colors.redAccent,),
      title: Text(
        "${basename(widget.file.path)}",
        style: TextStyle(
          fontSize: 14,
        ),
        maxLines: 2,
      ),
      subtitle: Text(
        "${FileUtils.formatBytes(widget.file == null ? 678476 : File(widget.file.path).lengthSync(), 2)},"
        " ${widget.file == null ? "Test" : FileUtils.formatTime(File(widget.file.path).lastModifiedSync().toIso8601String())}",
      ),
      trailing: widget.popTap == null
          ? null
          : FilePopup(
              path: widget.file.path,
              popTap: widget.popTap,
            ),
    );
  }
}
