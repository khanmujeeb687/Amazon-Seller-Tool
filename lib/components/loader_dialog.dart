
import 'package:flutter/material.dart';
import 'package:juna/values/assets.dart';
import 'package:juna/values/store.dart';
import 'package:lottie/lottie.dart';

showLoader(context,{bool barrierDismissible=false,bool backpressEnable=true}){
  store.LOADER_VISIBLE=true;
  showDialog(
      context: context,barrierDismissible:barrierDismissible ,
      barrierColor: Colors.transparent,
      builder: (context){
    return WillPopScope(
      onWillPop: (){
        store.LOADER_VISIBLE=!backpressEnable;
        return Future.value(backpressEnable);
      },
      child: AlertDialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Lottie.asset(Assets.LoadingAnimation),
      ),
    );
  });
}

hideLoader(context){
  if(store.LOADER_VISIBLE){
    store.LOADER_VISIBLE=false;
    Navigator.pop(context);
  }
}