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

  Future googleLogIn(String refferalcode) async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final authResult = await _auth.signInWithCredential(credential);

    // Get the user's name from their Google account
    final userProfile = googleUser?.displayName;
    if (_auth.currentUser == null) {
      print('User already signed in');
      return;
    }
    // Save the user's name to Firestore
    if (authResult.user != null) {
     await firestore.collection('user').doc(authResult.user!.uid).set({
        'userName': userProfile,
        'email': authResult.user!.email,
        'uid': authResult.user!.uid,
        "password": "",
        "role": "user",
        "refferalcode": refferalcode,
        "flatNumber": "",
        "dateOfBirth": "",
        "familyMember": "",
        "profileImg": "",
        "mobile": "",
        "vehical": "",
      });
    } else {
      print("objecthgdbcnk");
    }
  }
}
