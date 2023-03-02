import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProviderss extends ChangeNotifier {
  final _googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => user;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future googleSignOut() async {
    _googleSignIn.signOut();
    notifyListeners();
  }

  Future googleLogIn() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final AuthResult = await _auth.signInWithCredential(credential);

    // final User? user = AuthResult.user;
    // if (user != null) {
    //   // Check if user already exists in Firebase Authentication
    //   final UserCredential existingUserCredential =
    //       await _auth.signInWithCredential(
    //     GoogleAuthProvider.credential(
    //       accessToken: googleAuth.accessToken,
    //       idToken: googleAuth.idToken,
    //     ),
    //   );
      // final User? existingUser = existingUserCredential.user;
      // if (existingUser == null) {
      //   print("user exist");
      // } else {
      //   firestore.collection("user").doc("b").set(
      //       {'userName': user.displayName, 'email': user.email}).then((value) {
      //     // The data has been successfully added
      //     print('Data added successfully');
      //   }).catchError((error) {
      //     // An error occurred
      //     print('Error: $error');
      //   });
      //   notifyListeners();
      //   print("user not exist");
      // }
    // }
  }
}
