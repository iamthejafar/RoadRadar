import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:traffic_safety/src/utils/dialogs/error_dialog.dart';
import 'package:traffic_safety/src/utils/dialogs/loading_dIalog.dart';

class AuthRepo {
  Future<UserCredential?> login(String email, String password, BuildContext context) async {
    UserCredential? userCredential;
    try{
      showLoading(context);
       userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if(context.mounted){
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch(e){
      if(context.mounted){
        Navigator.of(context).pop();
        showErrorDialog(context, message: e.message!);
      }
    }
    return userCredential;
  }


  Future<UserCredential?> signUp(String email, String password, BuildContext context) async {
    UserCredential? userCredential;
    try{
      showLoading(context);
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if(context.mounted){
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch(e){
      if(context.mounted){
        Navigator.of(context).pop();
        showErrorDialog(context, message: e.message!);
      }
    }
    return userCredential;
  }

}
