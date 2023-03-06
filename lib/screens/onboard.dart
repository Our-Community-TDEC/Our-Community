import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:onboarding/onboarding.dart';
import 'package:our_community/nuemorphism/border_effect.dart';
import 'package:our_community/nuemorphism/colors.dart';
import 'package:our_community/screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController emailController = TextEditingController();
TextEditingController userNameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController cPasswordController = TextEditingController();

void main() {
  runApp(const OnBoard());
}

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  var theme;
  bool isDark = false;
  themeF(isDark) {
    print("Theme" + isDark.toString());
    if (isDark) {
      theme = DarkTheme();
    } else {
      theme = WhiteTheme();
    }
    setState(() {});
  }

  getPreference() async {
    var pref = await SharedPreferences.getInstance();
    isDark = pref.getBool("Theme")!;
    print("object" + isDark.toString());
    themeF(isDark);
  }

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    index = 0;
    getPreference();
    // getTheme();
  }
  late int index;
  String selecetedbutton = "";
  var text_style = TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w500,
      color: HexColor.WblueText,
      fontFamily: 'poppins');
  onboardingPagesList(boxL, minHW, labelStyle, alignStart) {
    return [
      PageModel(
        widget: DecoratedBox(
          decoration: BoxDecoration(
            color: HexColor.Wbackground_color,
            border: Border.all(
              width: 0.0,
              color: HexColor.Wbackground_color,
            ),
          ),
          child: SizedBox(
            height: 745,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Select your role",
                  style: TextStyle(
                      color: HexColor.WblueText,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: boxL - 4,
                      width: boxL - 4,
                      child: NeumorphicButton(
                          style: selecetedbutton == "button1"
                              ? theme.unselect_role
                              : theme.button,
                          onPressed: () {
                            setState(() {
                              selecetedbutton = "button1";
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/Images/role/admin.svg',
                                semanticsLabel: 'My SVG Image',
                              ),
                              Text("Admin", style: text_style),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: boxL - 4,
                      width: boxL - 4,
                      child: NeumorphicButton(
                          style: selecetedbutton == "button2"
                              ? theme.unselect_role
                              : theme.button,
                          onPressed: () {
                            print(selecetedbutton);
                            setState(() {
                              selecetedbutton = "button2";
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/Images/role/user.svg',
                                semanticsLabel: 'My SVG Image',
                              ),
                              Text("User", style: text_style),
                            ],
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: boxL - 4,
                      width: boxL - 4,
                      child: NeumorphicButton(
                          style: selecetedbutton == "button3"
                              ? theme.unselect_role
                              : theme.button,
                          onPressed: () {
                            setState(() {
                              selecetedbutton = "button3";
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/Images/role/doctor.svg',
                                semanticsLabel: 'My SVG Image',
                              ),
                              Text("Doctor", style: text_style),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: boxL - 4,
                      width: boxL - 4,
                      child: NeumorphicButton(
                          style: selecetedbutton == "button4"
                              ? theme.unselect_role
                              : theme.button,
                          onPressed: () {
                            setState(() {
                              selecetedbutton = "button4";
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/Images/role/electrician.svg',
                                semanticsLabel: 'My SVG Image',
                              ),
                              Text("Electrician", style: text_style),
                            ],
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: boxL - 4,
                      width: boxL - 4,
                      child: NeumorphicButton(
                          style: selecetedbutton == "button5"
                              ? theme.unselect_role
                              : theme.button,
                          onPressed: () {
                            setState(() {
                              selecetedbutton = "button5";
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/Images/role/plumber.svg',
                                semanticsLabel: 'My SVG Image',
                              ),
                              Text("Plumber", style: text_style),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: boxL - 4,
                      width: boxL - 4,
                      child: NeumorphicButton(
                          style: selecetedbutton == "button6"
                              ? theme.unselect_role
                              : theme.button,
                          onPressed: () {
                            setState(() {
                              selecetedbutton = "button6";
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/Images/role/cleaner.svg',
                                semanticsLabel: 'My SVG Image',
                              ),
                              Text("Cleaner", style: text_style),
                            ],
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      PageModel(
        widget: DecoratedBox(
          decoration: BoxDecoration(
            color: background,
            border: Border.all(
              width: 0.0,
              color: background,
            ),
          ),
          child: SizedBox(
            height: 745,
            child: Column(
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: minHW * 0.15)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 11.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.51,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Let's get you registered",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 35,
                                  color: Colors.grey,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: alignStart,
                                children: [
                                  // Text(
                                  //   "Name",
                                  //   style: text_head,
                                  // ),
                                  TextField(
                                    controller: userNameController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.grey,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      labelText: 'Name',
                                      // hintText: 'Enter Your Name',
                                      labelStyle: labelStyle,
                                      suffixIcon: const Icon(
                                          Icons.account_circle_outlined),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: alignStart,
                                children: [
                                  // Text(
                                  //   "Email",
                                  //   style: text_head,
                                  // ),
                                  TextField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.grey,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      labelText: 'Email ID',
                                      // hintText: 'Enter Your Email',
                                      labelStyle: labelStyle,
                                      suffixIcon: const Icon(
                                          Icons.alternate_email_sharp),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: alignStart,
                                children: [
                                  // Text("Password", style: text_head),
                                  TextField(
                                    obscureText: true,
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                        labelText: 'Password',
                                        // hintText: 'Password',
                                        suffixIcon: const Icon(Icons.key),
                                        labelStyle: labelStyle),
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    obscuringCharacter: "●",
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: alignStart,
                                children: [
                                  // Text("Confirm Password", style: text_head),
                                  TextField(
                                    obscureText: true,
                                    controller: cPasswordController,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                        labelText: 'Confirm Password',
                                        // hintText: 'Confirm Password',
                                        suffixIcon: const Icon(Icons.key),
                                        labelStyle: labelStyle),
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    obscuringCharacter: "●",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        // child: RichText(
                        // text: TextSpan(
                        //   text:
                        //       'By signing up, you are agree to our Terms & condition and privacy policy',
                        //   style: TextStyle(
                        //       color: Colors.white, fontSize: 18.0),
                        //   children: <TextSpan>[
                        //     TextSpan(
                        //         style: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //     )),
                        //   ],
                        // ),
                        // ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
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
                            onPressed: () {
                              createAccount();
                            },
                            child: const Text(
                              "Register",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LogIn()),
                          );
                        },
                        child: const Text(
                          "Joined us before? Login",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      PageModel(
        widget: DecoratedBox(
          decoration: BoxDecoration(
            color: background,
            border: Border.all(
              width: 0.0,
              color: background,
            ),
          ),
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 45.0,
                    vertical: 90.0,
                  ),
                  // child: Image.asset('assets/images/instagram.png',
                  //     color: pageImageColor),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 45.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'EASY ACCESS',
                      style: pageTitleStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Reach your files anytime from any devices anywhere',
                      style: pageInfoStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ];
  }

  static const width = 100.0;
  

  SizedBox _skipButton({void Function(int)? setIndex}) {
    return SizedBox(
        width: width,
        child: SizedBox(
          // height: 200,
          // width: 200,
          child: NeumorphicButton(
            style: theme.button,
            onPressed: () {
              if (index == 1) {
                print("setIndex");
                index = 2;
                setIndex!(2);
              } else if (setIndex != null) {
                print(setIndex);
                index = 1;
                setIndex(1);
              }
            },
            child: const Text(
              "Next",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }

  SizedBox get _signupButton {
    return SizedBox(
      width: width,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Material(
          borderRadius: defaultProceedButtonBorderRadius,
          color: defaultProceedButtonColor,
          child: InkWell(
            borderRadius: defaultProceedButtonBorderRadius,
            onTap: () {},
            child: const Padding(
              padding: defaultProceedButtonPadding,
              child: Text(
                'Sign up',
                style: defaultProceedButtonTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double minHW = min((MediaQuery.of(context).size.width),
        (MediaQuery.of(context).size.height));

    const labelStyle = TextStyle(
      color: Colors.white,
      fontSize: 18.0,
    );
    const alignStart = CrossAxisAlignment.start;
    double boxL = minHW * 0.42;
    var height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: HexColor.Wbackground_color,
        body: Onboarding(
            pages: onboardingPagesList(boxL, minHW, labelStyle, alignStart),
            onPageChange: (int pageIndex) {
              index = pageIndex;
            },
            footerBuilder: (context, dragDistance, pagesLength, setIndex) {
              return DecoratedBox(
                decoration: BoxDecoration(
                    // color: background,
                    // border: Border.all(
                    //   width: 0.0,
                    //   color: HexColor.Wbackground_color,
                    // ),
                    ),
                child: Expanded(
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: ColoredBox(
                        color: HexColor.Wbackground_color,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            index != pagesLength - 1
                                ? _skipButton(setIndex: setIndex)
                                : _signupButton,
                            Padding(
                              padding: const EdgeInsets.only(right: 45.0),
                              child: CustomIndicator(
                                netDragPercent: dragDistance,
                                pagesLength: pagesLength,
                                indicator: Indicator(
                                  activeIndicator: ActiveIndicator(
                                      color: HexColor.Whint, borderWidth: 2),
                                  closedIndicator: ClosedIndicator(
                                      color: HexColor.WblueText,
                                      borderWidth: 2),
                                  indicatorDesign: IndicatorDesign.line(
                                    lineDesign: LineDesign(
                                      lineSpacer: 30,
                                      lineType: DesignType.line_nonuniform,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void createAccount() async {
    String email = emailController.text.toString().trim();
    String userName = userNameController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    String confirmPassword = cPasswordController.text.toString().trim();

    if (email == "" ||
        password == "" ||
        confirmPassword == "" ||
        userName == "" ||
        selecetedbutton == "") {
      snackBar("Fill all the field");
      print("Fill all the field Or Select role");
    } else if (password != confirmPassword) {
      snackBar("Password And Confirm Password not match!");
      print("Password And Confirm Password not match!");
    } else if (password.length < 6) {
      snackBar("Please enter a password more than 6 characters long");
      print("Please enter a password more than 6 characters long");
    } else {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // User registration successful, save user details to Firestore
        firestore
            .collection("user")
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .set({
          "userName": userName,
          "email": email,
          "password": password,
        }).then((value) => {
                  snackBar("Registration successful"),
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LogIn()),
                  )
                });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          snackBar('The password provided is too weak.');
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          snackBar('The account already exists for that email.');
          print('The account already exists for that email.');
        } else if (e.code == 'invalid-email') {
          snackBar('Invalid email.');
          print('Invalid email.');
        } else {
          snackBar('Error: ${e.message}');
        }
      } on PlatformException catch (e) {
        snackBar('Error: ${e.message}');
      } catch (e) {
        snackBar('Error: ${e.toString()}');
      }
    }
  }

  snackBar(showMsg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(showMsg),
      backgroundColor: Colors.blue,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 100,
          right: 20,
          left: 20),
    ));
  }
}
