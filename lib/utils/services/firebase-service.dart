import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService{

  static final CollectionReference _userCollection = FirebaseFirestore.instance.collection("users");

  static Future<User?> createAcccount(Map data)async {
    try{
      UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: data['email'],
          password: data['password']
      );

      await _userCollection.add({
        "uid": credential.user!.uid.toString(),
        "name": data['name'],
        "emailVerifiedAt": null
      });

      print(credential.user);
      return Future.value(credential.user);
    }catch(e){
      return Future.error(e.toString());
    }
  }

}