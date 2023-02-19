import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:our_community/main.dart';
import 'package:our_community/provider/googlesignin.dart';
import 'package:our_community/screens/register/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../logic/login_logic.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';

TextEditingController emailTController = TextEditingController();
TextEditingController passwordTController = TextEditingController();

class LogIn extends StatefulWidget with Login_Logic {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  Color gradient_top = Color(0xFF2E2F36);

  Color gradient_bot = Color(0xE02E2F36);

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final user_detail = FirebaseAuth.instance.currentUser;

  bool isLoading = false;

  void showLoadingIndicator() {
    // Use a stateful widget to show a loading indicator on the screen
    setState(() {
      isLoading = true;
    });
  }

  void hideLoadingIndicator() {
    // Use a stateful widget to hide the loading indicator
    setState(() {
      isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    snackBar(show_msg) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(show_msg),
        backgroundColor: Colors.blue,
      ));
    }

    void log_in() async {
      String email = emailTController.text.trim();
      String password = passwordTController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        snackBar("Please fill all fields");
      } else {
        showLoadingIndicator();

        try {
          // Try to sign in with Firebase Auth
          await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                email: email,
                password: password,
              )
              .then((value) => {
                    emailTController.text = "",
                    passwordTController.text = "",
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => BasePage()),
                    ),
                  });
        } on FirebaseAuthException catch (e) {
          // Handle Firebase Auth exceptions
          switch (e.code) {
            case 'network-request-failed':
              snackBar('Check your internet connection');
              break;
            case 'invalid-email':
              snackBar('Invalid email address');
              break;
            case 'wrong-password':
              snackBar('Incorrect password');
              break;
            case 'user-disabled':
              snackBar('This account has been disabled');
              break;
            case 'user-not-found':
              snackBar('This user does not exist');
              break;
            default:
              snackBar('An error occurred while signing in');
          }
        } catch (e) {
          // Handle other exceptions
          snackBar('An error occurred while signing in');
        } finally {
          // Always clear the email and password fields and hide the loading indicator
          hideLoadingIndicator();
        }
      }
    }

    onsuccess() {
      // emailTController.text = "";
      // passwordTController.text = "";
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
                            Navigator.push(
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
                                  prov.googleLogIn().then(
                                        (value) => {
                                          Navigator.popUntil(context,
                                              (route) => route.isFirst),
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => BasePage(),
                                            ),
                                          ),
                                        },
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
