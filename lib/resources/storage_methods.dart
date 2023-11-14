import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseAuth authentication = FirebaseAuth.instance;

  // add image to firebase storage
  Future<String> uploadImageToStorage(
      String childName, Uint8List imageFile, bool isPost) async {
    Reference reference =
        storage.ref().child(childName).child(authentication.currentUser!.uid);

    UploadTask uploadTask = reference.putData(imageFile);
    
    TaskSnapshot snapShot = await uploadTask;
    
    String imageDownloadedUrl = await snapShot.ref.getDownloadURL();
    
    return imageDownloadedUrl;
  }
}
