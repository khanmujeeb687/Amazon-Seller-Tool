import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:juna/util/file_utils.dart';
import 'package:juna/widgets/BazarComponents.dart';
import '../values/colors.dart';
import '../values/styles.dart';
import '../widgets/bazar_text.dart';
import '../widgets/file_item.dart';


class PickFile extends StatefulWidget {
  List<File> data;
  PickFile(this.data);
  @override
  _PickFileState createState() => _PickFileState();
}

class _PickFileState extends State<PickFile> with TickerProviderStateMixin {
  List<File> _files=[];
  List<File> _selected=[];
  int page=0;
  ScrollController _controller;
  double _height = 100.0;
  final _focusNode = FocusNode();
  bool allowsearch=true;




  @override
  void initState() {
    _controller=ScrollController();
    addDate(0);
    _controller.addListener(() {
      if(_controller.position.pixels == _controller.position.maxScrollExtent){
        if(addDate(++page)){
          setState(() {_files=_files;});
        }
      }
    });
    _focusNode.addListener(() {
      if(_focusNode.hasFocus){
        setState(() {
          _height=2;
        });
      }else{
        _files.clear();
        page=0;
        addDate(0);
        setState(() {
          _files=_files;
          _height=100;
        });
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return WillPopScope(
      onWillPop: (){
        if(_focusNode.hasFocus){
          _focusNode.unfocus();
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: BazarRoundedButton("Selected items ${_selected.length}"),
          actions: [
            IconButton(
              icon: _selected.length>0?Icon(Feather.x):SizedBox(height: 0,width: 0,),
              onPressed: (){
                setState(() {
                  _selected.clear();
                });
              },
            ),

          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            controller: _controller,
            child: Column(
              children: [
                AnimatedSize(
                  curve: Curves.linearToEaseOut,
                  child: new Container(
                    width: MediaQuery.of(context).size.width,
                    height: _height,
                    color: BazarColors.background,
                    padding: EdgeInsets.only(bottom: _height==100?15:2),
                    alignment: Alignment.bottomLeft,
                    child: BazarText("Search a file",fontsize: _height==100?20:12),
                  ),
                  vsync: this,
                  duration: new Duration(milliseconds: 800),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Hero(
                      tag:"inputcategory",
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: BazarColors.lightgrey
                          ),
                          child: FormBuilderTextField(
                            onChanged:_onchange ,
                            focusNode: _focusNode,
                              decoration: Styles.InputStyle(label: _height!=200?"":"Search a file",hint: "Search a file"),
                              attribute: "query",
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                _files.isEmpty?Center(
                  child: Text("No PDF found!"),
                ):ListView.separated(
                  shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: _files.length,
                itemBuilder:
                (BuildContext context, int index) {
                  return FileItem(
                file: _files[index],
                    selected:_selected,
                    onclick:(){
                  setState(() {
                  });
                    }
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
              ],
            ),
          ),
        ),
        floatingActionButton: _selected.length>0?BazarRoundedButton("Next",onClick: (){
          Navigator.pop(context,_selected);
        }):SizedBox(height: 0,width: 0,),
      ),
    );
  }


  addDate(int l){
    if(l>=widget.data.length) return false;
    for(int i =l*20;i<(l*20)+20;i++){
      if(i<widget.data.length){
        _files.add(widget.data[i]);
      }else{
        break;
      }
    }
    return true;
  }


  void _onchange(value) async{
    if(!allowsearch) return;
    allowsearch=false;
    _files.clear();
    for(int i=0;i<widget.data.length;i++){
      File fs=widget.data[i];
      if(fs.path.toLowerCase().contains(value.toLowerCase()) && FileUtils.getExtention(fs.path) == ".pdf" ){
        _files.add(fs);
      }
    }
    allowsearch=true;
    setState(() {_files=_files;});
  }

}
