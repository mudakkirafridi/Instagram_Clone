
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/resources/storage_methods.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // sign up user
 Future<String> signUpUser({required String email , required String password,required String userName,required String bio , required Uint8List file})async{
    String res = "Some Error Occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty || userName.isNotEmpty || bio.isNotEmpty || file != null) {
        // register user 
        UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);

        String photoUrl = await StorageMethods().uploadImageToFirebaseStorage("profilePics", file, false);
   
         // add user to our database 
      await _firestore.collection("users").doc(cred.user!.uid).set({
          "userName": userName,
          "email": email,
          "uid": cred.user!.uid,
          "bio":bio,
          "followers":[],
          "following":[],
          "photoUrl":photoUrl
         });

         res = "success";
      }
      
    }on FirebaseAuthException catch(e){
      if (e.code == "invalid-email") {
        res = "The Email Is Badly Formatted";
      }else if(e.code == "weak-password"){
        res = "Password Should Be At Least 6 Character Long";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  // login method in auth
  Future<String> loginUser({
    required String email,
    required String password
  })async{
    String res = "Some Error Occurred";

  try {
    if (email.isNotEmpty || password.isNotEmpty) {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      res = "success";
    }
  }on FirebaseAuthException catch(e){
      if (e.code == "invalid-email") {
        res = "The Email Is Badly Formatted";
      }else if(e.code == "weak-password"){
        res = "Password Should Be At Least 6 Character Long";
      }
    } catch (e) {
    res= e.toString();
  }
 return res;
  }
}