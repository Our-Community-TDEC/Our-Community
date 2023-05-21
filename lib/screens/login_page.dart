import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:our_community/main.dart';
import 'package:our_community/nuemorphism/colors.dart';
import 'package:our_community/provider/googlesignin.dart';
import 'package:our_community/screens/onboard.dart';
import 'package:our_community/screens/register/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController refferalcode = TextEditingController();

  final user_detail = FirebaseAuth.instance.currentUser;

  bool isLoading = false;

  void showLoadingIndicator() {
    // Use a stateful widget to show a loading indicator on the screen
    setState(() {
      isLoading = true;
    });
  }

  bool isDark = false;
  @override
  void initState() {
    super.initState();
    getPreference();
  }

  getPreference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.containsKey("Theme")) {
      setState(() {
        isDark = pref.getBool("Theme")!;
      });
    }
    themeF(isDark);
  }

  var text_style;
  var labelStyle;

  themeF(isDark) {
    if (isDark) {
      text_style = TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: HexColor.text_color,
          fontFamily: 'poppins');

      labelStyle = TextStyle(
        color: HexColor.text_color,
        fontSize: 18.0,
      );
    } else {
      text_style = TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: HexColor.WblueText,
          fontFamily: 'poppins');

      labelStyle = TextStyle(
        color: HexColor.WblueText,
        fontSize: 18.0,
      );
    }
  }

  void hideLoadingIndicator() {
    // Use a stateful widget to hide the loading indicator
    setState(() {
      isLoading = false;
    });
  }

  _showAddEventDialog() async {
    await showDialog(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: AlertDialog(
          title: Text(
            'Your Refferal Code',
            textAlign: TextAlign.center,
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Refferal Code',
                ),
                controller: refferalcode,
              ),
            ],
          ),
          actions: [
            Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      child: Text('Sign in'),
                      onPressed: () {
                        final prov = Provider.of<GoogleSignInProviderss>(
                            context,
                            listen: false);
                        prov.googleLogIn(refferalcode.text).then(
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
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  snackBar(show_msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(show_msg),
      backgroundColor: Colors.blue,
    ));
  }

  Widget build(BuildContext context) {
    final theme = isDark ? DarkTheme() : WhiteTheme();

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

    return Theme(
        data: ThemeData(
          fontFamily: 'poppins',
        ),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              decoration: theme.background_color,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Column(
                      children: [
                        if (isDark)
                          Image(
                            image: AssetImage(
                                'assets/Images/Login/black_back.png'),
                          )
                        else
                          Image(
                            image: AssetImage(
                                'assets/Images/Login/background.png'),
                          )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                      child: Text(
                        "Welcome home",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 35,
                          color:
                              isDark ? HexColor.text_color : HexColor.WblueText,
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
                                style: theme.text_field,
                                child: TextField(
                                  style: TextStyle(
                                    color: isDark
                                        ? HexColor.text_color
                                        : HexColor.WblueText,
                                  ),
                                  controller: emailTController,
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    suffixIcon: Icon(
                                      Icons.perm_contact_cal_outlined,
                                      color: isDark
                                          ? HexColor.text_color
                                          : HexColor.WblueText,
                                    ),
                                    filled: true,
                                    // fillColor: HexColor.Wbackground_color,
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
                                style: theme.text_field,
                                child: TextField(
                                  obscureText: true,
                                  controller: passwordTController,
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    suffixIcon: Icon(
                                      Icons.key,
                                      color: isDark
                                          ? HexColor.text_color
                                          : HexColor.WblueText,
                                    ),
                                    filled: true,
                                    // fillColor: HexColor.Wbackground_color,

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
                        style: theme.button,
                        onPressed: () async {
                          log_in();
                        },
                        child: const Center(
                          child: Text(
                            "Log in",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueAccent,
                            ),
                            textAlign: TextAlign.center,
                          ),
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
                                  text: "New to app? ",
                                  style: text_style,
                                  children: [
                                    TextSpan(
                                        text: " Register now",
                                        style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontWeight: FontWeight.w500)),
                                  ]),
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
                    // Column(
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    //       child: Container(
                    //         width: 200,
                    //         height: 40,
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(10),
                    //         ),
                    //         child: SignInButton(
                    //           Buttons.Google,
                    //           onPressed: () {
                    //             final prov =
                    //                 Provider.of<GoogleSignInProviderss>(context,
                    //                     listen: false);
                    //             prov.googleLogIn(refferalcode.text).then(
                    //                   (value) => {
                    //                     Navigator.popUntil(
                    //                         context, (route) => route.isFirst),
                    //                     Navigator.pushReplacement(
                    //                       context,
                    //                       MaterialPageRoute(
                    //                         builder: (context) => BasePage(),
                    //                       ),
                    //                     ),
                    //                   },
                    //                 );
                    //           },
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
