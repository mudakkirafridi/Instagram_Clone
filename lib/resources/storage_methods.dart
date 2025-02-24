
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods {
  //instance for storage 
  FirebaseStorage _storage = FirebaseStorage.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  // adding image to firebase storage
  Future<String> uploadImageToFirebaseStorage(String childName,Uint8List file , bool isPost)async{

  Reference ref =  _storage.ref().child(childName).child(_auth.currentUser!.uid);
 UploadTask uploadTask = ref.putData(file);
   TaskSnapshot snap =  await uploadTask;
  String downloadUrl = await snap.ref.getDownloadURL();
  return downloadUrl;
  }
}