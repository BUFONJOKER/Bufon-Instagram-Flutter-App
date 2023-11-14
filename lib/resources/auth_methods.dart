import 'dart:typed_data';
import 'package:bufoninstagram_flutter/resources/storage_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthMethods {
  final FirebaseAuth authentication = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  UserCredential? userCredentials;

  // sign up with email and password
  Future<String> signUpUser({
    required String email,
    required String password,
    required String userName,
    required String bio,
    required Uint8List profileImage,
  }) async {
    String? response;
    response = "Some error occured";

    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          userName.isNotEmpty ||
          bio.isNotEmpty) {
        // register user
        userCredentials = await authentication.createUserWithEmailAndPassword(
            email: email, password: password);

        String imageUrl = await StorageMethods().uploadImageToStorage('profile', profileImage, false);
        
        // create map of user data
        Map<String, dynamic> data = {
          "userName": userName,
          "email": email,
          "bio": bio,
          "imageUrl": imageUrl,
          'followers': [],
          'following': [],
          "userId": userCredentials!.user!.uid,
          'createdAt': DateTime.now(),

        };
        // add user to firestore
        await firestore.collection('users').doc(userCredentials!.user!.uid).set(data);
        response = "User created successfully";
         
      } 
    } catch (error) {
      response = error.toString();
    }
    return response;
  }
}
