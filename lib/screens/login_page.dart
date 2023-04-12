import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:our_community/main.dart';
import 'package:our_community/nuemorphism/colors.dart';
import 'package:our_community/provider/googlesignin.dart';
import 'package:our_community/screens/onboard.dart';
import 'package:our_community/screens/register/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../logic/login_logic.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../nuemorphism/border_effect.dart';

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

    double width = MediaQuery.of(context).size.height;

    void log_in() async {
      String email = emailTController.text.trim();
      String password = passwordTController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        snackBar("Please fill all details");
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
        fontWeight: FontWeight.w400,
        color: HexColor.WblackText,
        fontFamily: 'poppins');

    var labelStyle = TextStyle(
      color: HexColor.Whint,
      fontSize: 18.0,
    );

    WhiteTheme Wt = new WhiteTheme();
    return Theme(
        data: ThemeData(
          fontFamily: 'poppins',
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: HexColor.Wbackground_color,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Column(
                    children: const [
                      Image(
                        image: AssetImage('assets/Images/Login/background.png'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                    child: Text(
                      "Welcome home",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 35,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 20),
                    child: SizedBox(
                      width: 352,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Neumorphic(
                              style: Wtext_field,
                              child: TextField(
                                controller: emailTController,
                                decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  suffixIcon: Icon(Icons.perm_contact_cal_outlined),
                                  filled: true,
                                  fillColor: HexColor.Wbackground_color,
                                  labelText: 'User ID',
                                  // hintText: 'User ID',
                                  labelStyle: labelStyle,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Neumorphic(
                              style: Wtext_field,
                              child: TextField(
                                obscureText: true,
                                controller: passwordTController,
                                decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  suffixIcon: Icon(Icons.key),
                                  filled: true,
                                  fillColor: HexColor.Wbackground_color,

                                  labelText: 'Password',
                                  // hintText: 'Password',
                                  labelStyle: labelStyle,
                                ),
                                enableSuggestions: false,
                                autocorrect: false,
                                obscuringCharacter: "●",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: NeumorphicButton(
                      style: Wt.button,
                      onPressed: () async {
                        log_in();
                      },
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500,
                          color: Colors.blueAccent,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OnBoard()));
                          },
                          child: RichText(
                            text: TextSpan(
                              text:"New to app? ",
                              style: text_style,
                              children: [
                                TextSpan(text: " Register now", style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.w500)),
                              ]
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Neumorphic(
                  //   style: NeumorphicStyle(
                  //     boxShape: NeumorphicBoxShape.path(MyShapePathProvider()),
                  //   ),
                  // ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SignInButton(
                            Buttons.Google,
                            onPressed: () {
                              final prov = Provider.of<GoogleSignInProviderss>(
                                  context,
                                  listen: false);
                              prov.googleLogIn().then(
                                    (value) => {
                                      Navigator.popUntil(
                                          context, (route) => route.isFirst),
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
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class MyShapePathProvider extends NeumorphicPathProvider {
  @override
  bool shouldReclip(NeumorphicPathProvider oldClipper) {
    return true;
  }

  @override
  Path getPath(Size size) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2, 0)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool get oneGradientPerPath => throw UnimplementedError();
}
