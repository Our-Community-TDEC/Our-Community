import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProviderss extends ChangeNotifier {
  final _googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => user;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

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
    await FirebaseAuth.instance.signInWithCredential(credential);

    final AuthResult =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final user = AuthResult.user;

    DocumentSnapshot snapshot =
        await firestore.collection("user").doc(user?.uid).get();

    if (!snapshot.exists) {
      // Add the user to the database
      firestore
          .collection("user")
          .doc(user?.uid)
          .set({'userName': user?.displayName, 'email': user?.email}).then((value) {
        // The data has been successfully added
        print('Data added successfully');
      }).catchError((error) {
        // An error occurred
        print('Error: $error');
      });

      notifyListeners();
    }
  }
}
