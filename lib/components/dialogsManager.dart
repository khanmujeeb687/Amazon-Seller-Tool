import 'package:flutter/material.dart';

import 'bazar_dialog.dart';

class DialogsManager{



 Future<bool> showAddressConfirmationDialog(context,address) async{
    bool a=await showDialog(
        context: context,builder: (context){
      return BazarAlertDialog(icon: Icons.location_on,buttonText: "Add address",content:address,headerTitle: "Add current address",);
    });
    return a==null?false:true;
  }
}