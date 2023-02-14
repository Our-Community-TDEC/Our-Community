import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:our_community/main.dart';
import 'package:our_community/provider/googlesignin.dart';
import 'package:our_community/screens/register/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../logic/login_logic.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';

final emailTController = TextEditingController();
final passwordTController = TextEditingController();

class LogIn extends StatelessWidget with Login_Logic {
  Color gradient_top = Color(0xFF2E2F36);
  Color gradient_bot = Color(0xE02E2F36);

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final user_detail = FirebaseAuth.instance.currentUser;

  @override
  void dispose() {
    emailTController.dispose();
    passwordTController.dispose();
    dispose();
    // super.dispose();
  }

  Widget build(BuildContext context) {
    snackBar(show_msg) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(show_msg),
        backgroundColor: Colors.blue,
      ));
    }

    void log_in() async {
      if (emailTController.text.isEmpty || passwordTController.text.isEmpty) {
        snackBar("Fill all the field");
      } else {
        CircularProgressIndicator(
          color: Colors.black,
        );
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailTController.text.trim(),
            password: passwordTController.text.trim(),
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'network-request-failed') {
            snackBar('Check your internet connection');
          } else if (e.code == 'invalid-email') {
            snackBar('Inavalid Email');
          } else if (e.code == 'wrong-password') {
            snackBar("your password is wrong");
          } else if (e.code == 'user-disabled') {
            snackBar('User is disabled');
          } else if (e.code == 'user-not-found') {
            snackBar("user Doesn't exist");
          } else {
            snackBar(e.code);
          }
        } catch (e) {
          snackBar(e.toString());
        }
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BasePage()),
        );
      }
      emailTController.text = "";
      passwordTController.text = "";
    }

    onsuccess() {
      print(user_detail?.displayName);
      print(user_detail?.email);
      // log(user_detail?.displayName.toString());
      // log(user_detail?.email.toString());
    }

    var text_style = TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w300,
        color: Colors.white,
        fontFamily: 'poppins');

    const labelStyle = TextStyle(
      color: Colors.white,
      fontSize: 18.0,
    );

    return Theme(
        data: ThemeData(
          fontFamily: 'poppins',
        ),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [gradient_top, gradient_bot],
              )),
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 64),
                            child: Image(
                              image:
                              AssetImage('assets/Images/Login/Trees.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "Welcome home 😃",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 35,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                      child: SizedBox(
                        width: 352,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: TextField(
                                controller: emailTController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  labelText: 'User ID',
                                  labelStyle: labelStyle,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: TextField(
                                obscureText: true,
                                controller: passwordTController,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.key),
                                  filled: true,
                                  fillColor: Colors.grey,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  labelText: 'Password',
                                  // hintText: 'Password',
                                  labelStyle: labelStyle,
                                ),
                                enableSuggestions: false,
                                autocorrect: false,
                                obscuringCharacter: "●",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: SizedBox(
                        width: 200,
                        height: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.grey[600],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          onPressed: () async {
                            showDialog(
                                context: context,
                                builder: (context) => Center(
                                  child: CircularProgressIndicator(),
                                ));
                            // showDialog(
                            //   context: context,
                            //   barrierDismissible: false,
                            //   builder: (context) =>
                            //       Center(child: CircularProgressIndicator()),
                            // );
                            log_in();
                          },
                          child: Text(
                            "Log in",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          child: Text(
                            "New to app? Register",
                            style: text_style,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                            child: Container(
                              width: 200,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SignInButton(
                                Buttons.Google,
                                onPressed: () {
                                  final prov =
                                  Provider.of<GoogleSignInProviderss>(
                                      context,
                                      listen: false);
                                  // prov.googleLogIn().then((value) => {
                                  //       firestore
                                  //           .collection('user')
                                  //           .doc(user_detail?.uid)
                                  //           .set({
                                  //         "email": user_detail!.email,
                                  //         "userName": user_detail!.displayName
                                  //       }).then((value) => snackBar("show_msg1")),
                                  //       snackBar("show_ms2")
                                  //     });
                                  prov
                                      .googleLogIn()
                                      .then((value) => {onsuccess()});
                                  // prov.googleLogIn().then((value) => {
                                  //       snackBar(user_detail!.email),
                                  //       log(user_detail!.email.toString()),
                                  //       print(user_detail!.email)
                                  //     });
                                  Navigator.popUntil(
                                      context, (route) => route.isFirst);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BasePage()),
                                  );
                                },
                              ),
                            )),
                      ],
                    ),
                    Container(
                      height: 200,
                      width: 200,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}