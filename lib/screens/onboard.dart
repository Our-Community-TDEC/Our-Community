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
  DarkTheme theme = DarkTheme();
  var getstart_textstyle;
  var labelStyle;
  var textfield_style;
  var textfield_decoration_name;
  var textfield_decoration_conf_pass;
  var textfield_decoration_pass;
  var textfield_decoration_email;
  var join_textstyle;
  var btn_txt_style;
  var back_color;
  var icon_color = HexColor.WiconColor;
  var hint = ["Name", "Email"];
  bool isDark = false;
  themeF(isDark) {
    print("Theme" + isDark.toString());
    if (true) {
      // theme = DarkTheme();
      icon_color = HexColor.icon_color;
      getstart_textstyle = TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 35,
        color: HexColor.text_color,
      );

      btn_txt_style = TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: HexColor.text_color,
      );

      back_color = theme.background_color;

      join_textstyle = TextStyle(
        color: HexColor.text_color,
      );

      textfield_decoration_name = InputDecoration(
        filled: true,
        fillColor: HexColor.background_top,
        labelText: 'Name',
        // hintText: 'Enter Your Name',
        labelStyle: labelStyle,
        suffixIcon: Icon(
          Icons.account_circle_outlined,
          color: icon_color,
        ),
      );
      textfield_decoration_email = InputDecoration(
        filled: true,
        fillColor: HexColor.background_top,
        labelText: 'Email',
        // hintText: 'Enter Your Name',
        labelStyle: labelStyle,
        suffixIcon: Icon(
          Icons.email_outlined,
          color: icon_color,
        ),
      );
      textfield_decoration_pass = InputDecoration(
        filled: true,
        fillColor: HexColor.background_top,
        labelText: 'Password',
        // hintText: 'Enter Your Name',
        labelStyle: labelStyle,
        suffixIcon: Icon(
          Icons.key,
          color: icon_color,
        ),
      );
      textfield_decoration_conf_pass = InputDecoration(
        filled: true,
        fillColor: HexColor.background_top,
        labelText: 'Confirm Password',
        // hintText: 'Enter Your Name',
        labelStyle: labelStyle,
        suffixIcon: Icon(
          Icons.password,
          color: icon_color,
        ),
      );

      icon_color = HexColor.icon_color;

      labelStyle = TextStyle(
        color: HexColor.text_color,
        fontSize: 18.0,
      );

      textfield_style = TextStyle(
        color: HexColor.text_color,
      );
    } else {
      // theme = WhiteTheme();
      back_color = theme.background_color;
      icon_color = HexColor.WiconColor;
      getstart_textstyle = TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 35,
        color: HexColor.WblueText,
      );
      textfield_decoration_name = InputDecoration(
        filled: true,
        fillColor: HexColor.Wbackground_color,
        labelText: 'Name',
        // hintText: 'Enter Your Name',
        labelStyle: labelStyle,
        suffixIcon: Icon(
          Icons.account_circle_outlined,
          color: icon_color,
        ),
      );
      textfield_decoration_email = InputDecoration(
        filled: true,
        fillColor: HexColor.Wbackground_color,
        labelText: 'Email',
        // hintText: 'Enter Your Name',
        labelStyle: labelStyle,
        suffixIcon: Icon(
          Icons.email_outlined,
          color: icon_color,
        ),
      );
      textfield_decoration_pass = InputDecoration(
        filled: true,
        fillColor: HexColor.Wbackground_color,
        labelText: 'Password',
        // hintText: 'Enter Your Name',
        labelStyle: labelStyle,
        suffixIcon: Icon(
          Icons.key,
          color: icon_color,
        ),
      );
      textfield_decoration_conf_pass = InputDecoration(
        filled: true,
        fillColor: HexColor.Wbackground_color,
        labelText: 'Confirm Password',
        // hintText: 'Enter Your Name',
        labelStyle: labelStyle,
        suffixIcon: Icon(
          Icons.password,
          color: icon_color,
        ),
      );

      join_textstyle = TextStyle(
        color: HexColor.WblueText,
      );

      labelStyle = TextStyle(
        color: HexColor.WblueText,
        fontSize: 18.0,
      );

      btn_txt_style = TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: HexColor.WblueText,
      );

      textfield_style = TextStyle(
        color: HexColor.WblueText,
      );
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
  String role = "";
  var text_style = TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w500,
      color: HexColor.WblueText,
      fontFamily: 'poppins');
  onboardingPagesList(boxL, minHW, labelStyle, alignStart) {
    return [
      PageModel(
        widget: DecoratedBox(
          decoration: theme.background_color,
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
                              ? theme.selected_role
                              : theme.unselect_role,
                          onPressed: () {
                            setState(() {
                              selecetedbutton = "button1";
                              role = "admin";
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
                              ? theme.selected_role
                              : theme.unselect_role,
                          onPressed: () {
                            print(selecetedbutton);
                            setState(() {
                              selecetedbutton = "button2";
                              role = "user";
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
                              ? theme.selected_role
                              : theme.unselect_role,
                          onPressed: () {
                            setState(() {
                              selecetedbutton = "button3";
                              role = "doctor";
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
                              ? theme.selected_role
                              : theme.unselect_role,
                          onPressed: () {
                            setState(() {
                              selecetedbutton = "button4";
                              role = "electrician";
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
                              ? theme.selected_role
                              : theme.unselect_role,
                          onPressed: () {
                            setState(() {
                              selecetedbutton = "button5";
                              role = "plumber";
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
                              ? theme.selected_role
                              : theme.unselect_role,
                          onPressed: () {
                            setState(() {
                              selecetedbutton = "button6";
                              role = "cleaner";
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
          decoration: back_color,
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
                              Text(
                                "Let's get you registered",
                                style: getstart_textstyle,
                              ),
                              Column(
                                crossAxisAlignment: alignStart,
                                children: [
                                  // Text(
                                  //   "Name",
                                  //   style: text_head,
                                  // ),
                                  Neumorphic(
                                    style: theme.text_field,
                                    child: TextField(
                                      style: textfield_style,
                                      decoration: textfield_decoration_name,
                                      controller: userNameController,
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
                                  Neumorphic(
                                    style: theme.text_field,
                                    child: TextField(
                                      style: textfield_style,
                                      decoration: textfield_decoration_email,
                                      controller: emailController,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: alignStart,
                                children: [
                                  // Text("Password", style: text_head),
                                  Neumorphic(
                                    style: theme.text_field,
                                    child: TextField(
                                      obscureText: true,
                                      style: textfield_style,
                                      decoration: textfield_decoration_pass,
                                      enableSuggestions: false,
                                      autocorrect: false,
                                      obscuringCharacter: "●",
                                      controller: passwordController,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: alignStart,
                                children: [
                                  // Text("Confirm Password", style: text_head),
                                  Neumorphic(
                                    style: theme.text_field,
                                    child: TextField(
                                      style: textfield_style,
                                      decoration:
                                          textfield_decoration_conf_pass,
                                      controller: cPasswordController,
                                      enableSuggestions: false,
                                      autocorrect: false,
                                      obscuringCharacter: "●",
                                    ),
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
                          child: NeumorphicButton(
                            style: theme.button,
                            onPressed: () {
                              createAccount();
                            },
                            child: Text(
                              "Register",
                              style: btn_txt_style,
                              textAlign: TextAlign.center,
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
                        child: Text(
                          "Joined us before? Login",
                          style: join_textstyle,
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
              return Positioned(
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: isDark
                        ? HexColor.Wbackground_color
                        : HexColor.background_top,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                                  color: HexColor.WblueText, borderWidth: 2),
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
          "role": role,
        }).then((value) => {
                  snackBar("Registration successful"),
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => LogIn()),
                  // )
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
