import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ourpass_auth/utils/services/firebase-service.dart';
import 'package:ourpass_auth/utils/services/notification-service.dart';

class UserProvider extends ChangeNotifier{

  void createAccount(Map payload)async{
    try{
      User? user = await FirebaseService.createAcccount(payload);

    }catch(e){
      print(e);
      NotificationService.showError(e.toString());
    }
  }

}