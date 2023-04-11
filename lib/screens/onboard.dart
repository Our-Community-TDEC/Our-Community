import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onboarding/onboarding.dart';
import 'package:our_community/screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../nuemorphism/colors.dart';
import 'package:our_community/nuemorphism/border_effect.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

TextEditingController cemailController = TextEditingController();
TextEditingController cuserNameController = TextEditingController();
TextEditingController cpasswordController = TextEditingController();
TextEditingController coPasswordController = TextEditingController();
TextEditingController creferralController = TextEditingController();
TextEditingController cflatNumber = TextEditingController();
TextEditingController cvehicalNumber = TextEditingController();
TextEditingController cMobileNumber = TextEditingController();
TextEditingController cdate = TextEditingController();
TextEditingController cyear = TextEditingController();
TextEditingController cmonth = TextEditingController();
TextEditingController cfamilyMember = TextEditingController();
TextEditingController csloteController = TextEditingController();
TextEditingController ctimeHourController = TextEditingController();
TextEditingController ctimeMinuteController = TextEditingController();

void main() {
  runApp(const OnBoard());
}

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  bool uploadingImage = false;
  bool _isButtonEnabled = true;
  String imageUrl = '';

  WhiteTheme theme = WhiteTheme();
  var getstart_textstyle;
  var labelStyle;
  var textfield_style;
  var textfield_decoration_name;
  var textfield_decoration_conf_pass;
  var textfield_decoration_pass;
  var textfield_decoration_email;
  var textfield_decoration_referral_code;
  var join_textstyle;
  var btn_txt_style;
  var back_color;
  var icon_color = HexColor.WiconColor;
  var hint = ["Name", "Email"];
  bool isDark = false;

  themeF(isDark) {
    print(MediaQuery.of(context).size.width / 2.28);
    icon_color = isDark ? HexColor.text_color : HexColor.WblackText;
    print("Theme" + isDark.toString());
    if (false) {
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
      textfield_decoration_referral_code = InputDecoration(
        filled: true,
        fillColor: HexColor.background_top,
        labelText: 'referral code',
        // hintText: 'Enter Your Name',
        labelStyle: labelStyle,
        suffixIcon: Icon(
          Icons.qr_code_rounded,
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
      print("object");
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

      textfield_decoration_referral_code = InputDecoration(
        filled: true,
        fillColor: HexColor.Wbackground_color,
        labelText: 'Referral code',
        // hintText: 'Enter Your Name',
        labelStyle: labelStyle,
        suffixIcon: Icon(
          Icons.qr_code_sharp,
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
  String serviceProvider = "";
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
                            : theme.selected_role,
                        onPressed: () {
                          setState(() {
                            selecetedbutton = "button1";
                            role = "admin";
                            serviceProvider = "";
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
                            : theme.selected_role,
                        onPressed: () {
                          print(selecetedbutton);
                          setState(() {
                            selecetedbutton = "button2";
                            role = "user";
                            serviceProvider = "";
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
                            : theme.selected_role,
                        onPressed: () {
                          setState(() {
                            selecetedbutton = "button3";
                            role = "doctor";
                            serviceProvider = "service";
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
                            : theme.selected_role,
                        onPressed: () {
                          setState(() {
                            selecetedbutton = "button4";
                            role = "electrician";
                            serviceProvider = "service";
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
                            : theme.selected_role,
                        onPressed: () {
                          setState(() {
                            selecetedbutton = "button5";
                            role = "plumber";
                            serviceProvider = "service";
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
                            : theme.selected_role,
                        onPressed: () {
                          setState(() {
                            selecetedbutton = "button6";
                            role = "cleaner";
                            serviceProvider = "service";
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
      PageModel(
        widget: DecoratedBox(
          decoration: theme.background_color,
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
                        height: MediaQuery.of(context).size.height * 0.49,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Let's get you registered",
                              style: getstart_textstyle,
                            ),
                            Neumorphic(
                              style: theme.text_field,
                              child: TextField(
                                style: textfield_style,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: isDark
                                      ? HexColor.background_top
                                      : HexColor.Wbackground_color,
                                  labelText: 'Name',
                                  // hintText: 'Enter Your Name',
                                  labelStyle: TextStyle(
                                    color: isDark
                                        ? HexColor.text_color
                                        : HexColor.WblackText,
                                    fontSize: 18.0,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.account_circle_outlined,
                                    color: icon_color,
                                  ),
                                ),
                                controller: cuserNameController,
                              ),
                            ),
                            Neumorphic(
                              style: theme.text_field,
                              child: TextField(
                                style: textfield_style,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: isDark
                                      ? HexColor.background_top
                                      : HexColor.Wbackground_color,
                                  labelText: 'Email',
                                  // hintText: 'Enter Your Name',
                                  labelStyle: TextStyle(
                                    color: isDark
                                        ? HexColor.text_color
                                        : HexColor.WblackText,
                                    fontSize: 18.0,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.account_circle_outlined,
                                    color: icon_color,
                                  ),
                                ),
                                controller: cemailController,
                              ),
                            ),
                           Neumorphic(
                              style: theme.text_field,
                              child: TextField(
                                style: textfield_style,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: isDark
                                      ? HexColor.background_top
                                      : HexColor.Wbackground_color,
                                  labelText: 'Password',
                                  // hintText: 'Enter Your Name',
                                  labelStyle: TextStyle(
                                    color: isDark
                                        ? HexColor.text_color
                                        : HexColor.WblackText,
                                    fontSize: 18.0,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.account_circle_outlined,
                                    color: icon_color,
                                  ),
                                ),
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                obscuringCharacter: "●",
                                controller: cpasswordController,
                              ),
                            ),
                           Neumorphic(
                              style: theme.text_field,
                              child: TextField(
                                style: textfield_style,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: isDark
                                      ? HexColor.background_top
                                      : HexColor.Wbackground_color,
                                  labelText: 'Confirm Password',
                                  // hintText: 'Enter Your Name',
                                  labelStyle: TextStyle(
                                    color: isDark
                                        ? HexColor.text_color
                                        : HexColor.WblackText,
                                    fontSize: 18.0,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.account_circle_outlined,
                                    color: icon_color,
                                  ),
                                ),
                                controller: coPasswordController,
                                enableSuggestions: false,
                                autocorrect: false,
                                obscuringCharacter: "●",
                              ),
                            ),
                            role != "admin"
                                ? Neumorphic(
                              style: theme.text_field,
                              child: TextField(
                                style: textfield_style,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: isDark
                                      ? HexColor.background_top
                                      : HexColor.Wbackground_color,
                                  labelText: 'Refeeral code',
                                  // hintText: 'Enter Your Name',
                                  labelStyle: TextStyle(
                                    color: isDark
                                        ? HexColor.text_color
                                        : HexColor.WblackText,
                                    fontSize: 18.0,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.account_circle_outlined,
                                    color: icon_color,
                                  ),
                                ),
                                controller: creferralController,
                              ),
                            )
                                : Column()
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
      PageModel(
        widget: SingleChildScrollView(
          child: DecoratedBox(
            decoration: theme.background_color,
            child: Column(
              children: [
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 1.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Your Information",
                              style: getstart_textstyle,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.28,
                              height: MediaQuery.of(context).size.width / 2.28,
                              child: Neumorphic(
                                style: theme.circle_container_style,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () async {
                                        ImagePicker imagePicker = ImagePicker();
                                        XFile? file =
                                            await imagePicker.pickImage(
                                                source: ImageSource.camera);

                                        if (file == null) return;

                                        String uniqueFileName = DateTime.now()
                                            .millisecondsSinceEpoch
                                            .toString();

                                        Reference referenceRoot =
                                            FirebaseStorage.instance.ref();
                                        Reference referenceDirImages =
                                            referenceRoot.child('complaint/');

                                        Reference referenceImageToUpload =
                                            referenceDirImages
                                                .child(uniqueFileName);

                                        try {
                                          setState(() {
                                            uploadingImage = true;
                                            _isButtonEnabled = false;
                                          });

                                          await referenceImageToUpload
                                              .putFile(File(file.path));

                                          setState(() async {
                                            imageUrl =
                                                await referenceImageToUpload
                                                    .getDownloadURL();
                                          });

                                          setState(() {
                                            uploadingImage = false;
                                            _isButtonEnabled = true;
                                          });
                                        } catch (error) {
                                          setState(() {
                                            _isButtonEnabled = true;
                                            uploadingImage = false;
                                          });
                                        }
                                      },
                                      icon: Icon(Icons.add_a_photo),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        ImagePicker imagePicker = ImagePicker();
                                        XFile? file =
                                            await imagePicker.pickImage(
                                                source: ImageSource.gallery);

                                        if (file == null) return;

                                        String uniqueFileName = DateTime.now()
                                            .millisecondsSinceEpoch
                                            .toString();

                                        Reference referenceRoot =
                                            FirebaseStorage.instance.ref();
                                        Reference referenceDirImages =
                                            referenceRoot.child('complaint/');

                                        Reference referenceImageToUpload =
                                            referenceDirImages
                                                .child(uniqueFileName);

                                        try {
                                          setState(() {
                                            uploadingImage = true;
                                            _isButtonEnabled = false;
                                          });

                                          await referenceImageToUpload
                                              .putFile(File(file.path));
                                          imageUrl =
                                              await referenceImageToUpload
                                                  .getDownloadURL();

                                          setState(() {
                                            uploadingImage = false;
                                            _isButtonEnabled = true;
                                          });
                                        } catch (error) {
                                          setState(() {
                                            _isButtonEnabled = true;
                                            uploadingImage = false;
                                          });
                                        }
                                      },
                                      icon: Icon(Icons.upload_file_outlined),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Neumorphic(
                              style: theme.text_field,
                              child: TextField(
                                style: textfield_style,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: isDark
                                      ? HexColor.background_top
                                      : HexColor.Wbackground_color,
                                  labelText: 'Name',
                                  // hintText: 'Enter Your Name',
                                  labelStyle: TextStyle(
                                    color: isDark
                                        ? HexColor.text_color
                                        : HexColor.WblackText,
                                    fontSize: 18.0,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.account_circle_outlined,
                                    color: icon_color,
                                  ),
                                ),
                                controller: cuserNameController,
                              ),
                            ),
                            Neumorphic(
                              style: theme.text_field,
                              child: TextField(
                                style: textfield_style,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: isDark
                                      ? HexColor.background_top
                                      : HexColor.Wbackground_color,
                                  labelText: 'flat/house number',
                                  // hintText: 'Enter Your Name',
                                  labelStyle: TextStyle(
                                    color: isDark
                                        ? HexColor.text_color
                                        : HexColor.WblackText,
                                    fontSize: 18.0,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.account_circle_outlined,
                                    color: icon_color,
                                  ),
                                ),
                                controller: cflatNumber,
                              ),
                            ),
                            Neumorphic(
                              style: theme.text_field,
                              child: TextField(
                                style: textfield_style,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: isDark
                                      ? HexColor.background_top
                                      : HexColor.Wbackground_color,
                                  labelText: 'Vehical number',
                                  // hintText: 'Enter Your Name',
                                  labelStyle: TextStyle(
                                    color: isDark
                                        ? HexColor.text_color
                                        : HexColor.WblackText,
                                    fontSize: 18.0,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.account_circle_outlined,
                                    color: icon_color,
                                  ),
                                ),
                                controller: cvehicalNumber,
                              ),
                            ),
                            Neumorphic(
                              style: theme.text_field,
                              child: TextField(
                                style: textfield_style,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: isDark
                                      ? HexColor.background_top
                                      : HexColor.Wbackground_color,
                                  labelText: 'Mobile number',
                                  // hintText: 'Enter Your Name',
                                  labelStyle: TextStyle(
                                    color: isDark
                                        ? HexColor.text_color
                                        : HexColor.WblackText,
                                    fontSize: 18.0,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.account_circle_outlined,
                                    color: icon_color,
                                  ),
                                ),
                                controller: cMobileNumber,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 3.5,
                                  child: Neumorphic(
                                    style: theme.text_field,
                                    child: TextField(
                                      style: textfield_style,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: isDark
                                            ? HexColor.background_top
                                            : HexColor.Wbackground_color,
                                        labelText: 'MM',
                                        // hintText: 'Enter Your Name',
                                        labelStyle: TextStyle(
                                          color: isDark
                                              ? HexColor.text_color
                                              : HexColor.WblackText,
                                          fontSize: 18.0,
                                        ),
                                        suffixIcon: Icon(
                                          Icons.account_circle_outlined,
                                          color: icon_color,
                                        ),
                                      ),
                                      controller: cmonth,
                                    ),
                                  ),
                                ),
                                Neumorphic(
                                  style: theme.text_field,
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
                                    child: TextField(
                                      style: textfield_style,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: isDark
                                            ? HexColor.background_top
                                            : HexColor.Wbackground_color,
                                        labelText: 'DD',
                                        // hintText: 'Enter Your Name',
                                        labelStyle: TextStyle(
                                          color: isDark
                                              ? HexColor.text_color
                                              : HexColor.WblackText,
                                          fontSize: 18.0,
                                        ),
                                        suffixIcon: Icon(
                                          Icons.account_circle_outlined,
                                          color: icon_color,
                                        ),
                                      ),
                                      controller: cdate,
                                    ),
                                  ),
                                ),
                                Neumorphic(
                                  style: theme.text_field,
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
                                    child: TextField(
                                      style: textfield_style,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: isDark
                                            ? HexColor.background_top
                                            : HexColor.Wbackground_color,
                                        labelText: 'YYYY',
                                        // hintText: 'Enter Your Name',
                                        labelStyle: TextStyle(
                                          color: isDark
                                              ? HexColor.text_color
                                              : HexColor.WblackText,
                                          fontSize: 18.0,
                                        ),
                                        suffixIcon: Icon(
                                          Icons.account_circle_outlined,
                                          color: icon_color,
                                        ),
                                      ),
                                      controller: cyear,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Neumorphic(
                              style: theme.text_field,
                              child: TextField(
                                style: textfield_style,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: isDark
                                      ? HexColor.background_top
                                      : HexColor.Wbackground_color,
                                  labelText: 'Family members',
                                  // hintText: 'Enter Your Name',
                                  labelStyle: TextStyle(
                                    color: isDark
                                        ? HexColor.text_color
                                        : HexColor.WblackText,
                                    fontSize: 18.0,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.account_circle_outlined,
                                    color: icon_color,
                                  ),
                                ),
                                controller: cfamilyMember,
                              ),
                            ),
                            if (serviceProvider == "service")
                              Neumorphic(
                                style: theme.text_field,
                                child: TextField(
                                  controller: csloteController,
                                  textCapitalization: TextCapitalization.words,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: isDark
                                        ? HexColor.background_top
                                        : HexColor.Wbackground_color,
                                    labelText: 'slote for a day',
                                    labelStyle: TextStyle(
                                      color: isDark
                                          ? HexColor.text_color
                                          : HexColor.WblackText,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                              ),
                            if (serviceProvider == "service")
                              Row(
                                children: [
                                  Text(
                                    "time for a slot",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: isDark
                                            ? HexColor.text_color
                                            : HexColor.WblackText),
                                  ),
                                ],
                              ),
                            if (serviceProvider == "service")
                              Row(
                                children: [
                                  Flexible(
                                    child: Neumorphic(
                                      style: theme.text_field,
                                      child: TextField(
                                        controller: ctimeHourController,
                                        textCapitalization:
                                            TextCapitalization.words,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: isDark
                                              ? HexColor.background_top
                                              : HexColor.Wbackground_color,
                                          labelText: 'Hour',
                                          labelStyle: TextStyle(
                                            color: isDark
                                                ? HexColor.text_color
                                                : HexColor.WblackText,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Flexible(
                                    child: Neumorphic(
                                      style: theme.text_field,
                                      child: TextField(
                                        controller: ctimeMinuteController,
                                        textCapitalization:
                                            TextCapitalization.words,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: isDark
                                              ? HexColor.background_top
                                              : HexColor.Wbackground_color,
                                          labelText: 'Minute',
                                          labelStyle: TextStyle(
                                            color: isDark
                                                ? HexColor.text_color
                                                : HexColor.WblackText,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
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
                  ],
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Onboarding(
                  pages:
                      onboardingPagesList(boxL, minHW, labelStyle, alignStart),
                  onPageChange: (int pageIndex) {
                    index = pageIndex;
                  },
                  footerBuilder:
                      (context, dragDistance, pagesLength, setIndex) {
                    return Container(
                      decoration: BoxDecoration(
                        color: isDark
                            ? HexColor.background_top
                            : HexColor.Wbackground_color,
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<bool> checkIfReferralExists(String referralCode) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection("refferalcode")
          .where("code", isEqualTo: referralCode)
          .get();

      return querySnapshot.size > 0;
    } catch (e) {
      // Handle any errors that occur while querying Firestore
      return false;
    }
  }

  bool isCodeTrue = true;

  void createAccount() async {
    String email = cemailController.text.toString().trim();
    String userName = cuserNameController.text.toString().trim();
    String password = cpasswordController.text.toString().trim();
    String confirmPassword = coPasswordController.text.toString().trim();
    String refferalcode = creferralController.text.toString().trim();
    String flatNumber = cflatNumber.text.toString().trim();
    String date = cdate.text.toString().trim();
    String year = cyear.text.toString().trim();
    String month = cmonth.text.toString().trim();
    String familyMember = cfamilyMember.text.toString().trim();
    String slote = csloteController.text.toString().trim();
    String hour = ctimeHourController.text.toString().trim();
    String minute = ctimeMinuteController.text.toString().trim();
    String mobile = cMobileNumber.text.toString().trim();
    String DOB = "$date-$month-$year";

    if (role == "admin") {
      String randomString = Random().nextInt(999999).toString().padLeft(6, '0');
      refferalcode =
          email.substring(0, 2) + userName.substring(0, 2) + randomString;
      isCodeTrue = true;
      print(refferalcode + "szdfcdgvf");
    } else {
      print(isCodeTrue);
      isCodeTrue = await checkIfReferralExists(refferalcode);
    }

    if (email == "" ||
        password == "" ||
        confirmPassword == "" ||
        userName == "" ||
        selecetedbutton == "" ||
        refferalcode == "" ||
        !isCodeTrue ||
        flatNumber == "" ||
        date == "" ||
        year == "" ||
        month == "" ||
        familyMember == "" ||
        mobile == "") {
      snackBar("Fill all the field");
      print("Fill all the field Or Select role Or refferal code not match");
    } else if (serviceProvider != "" &&
        (slote == "" || minute == "" || hour == "")) {
      print(serviceProvider);
      if (slote == "" || minute == "" || hour == "") {
        print("Fill all the field ");
      }
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
          "refferalcode": refferalcode,
          "flatNumber": flatNumber,
          "dateOfBirth": DOB,
          "familyMember": familyMember,
          "profileImg": imageUrl,
          "mobile":mobile,
          "vehical":cvehicalNumber
        }).then((value) => {
                  if (role == "admin")
                    {
                      firestore
                          .collection("refferalcode")
                          .doc()
                          .set({"code": refferalcode},SetOptions(merge: true)).then(
                              (value) => snackBar("Registration successful"))
                    },
                  if (role == "doctor")
                    {
                      firestore.collection("user").doc(FirebaseAuth.instance.currentUser?.uid).set({
                        "slot": slote,
                        "time": "$hour hr $minute min",
                      },SetOptions(merge: true)).then((value) => snackBar("Registration successful"))
                    },
                  if (role == "electrician")
                    {
                      firestore
                          .collection("user")
                          .doc(FirebaseAuth.instance.currentUser?.uid)
                          .set({
                        "slot": slote,
                        "time": "$hour hr $minute min",
                      },SetOptions(merge: true)).then((value) => snackBar("Registration successful"))
                    },
                  if (role == "plumber")
                    {
                      firestore
                          .collection("user")
                          .doc(FirebaseAuth.instance.currentUser?.uid)
                          .set({
                        "slot": slote,
                        "time": "$hour hr $minute min",
                      },SetOptions(merge: true)).then((value) => snackBar("Registration successful"))
                    },
                  if (role == "cleaner")
                    {
                      firestore
                          .collection("user")
                          .doc(FirebaseAuth.instance.currentUser?.uid)
                          .set({
                        "slot": slote,
                        "time": "$hour hr $minute min",
                      },SetOptions(merge: true)).then((value) => snackBar("Registration successful"))
                    },
                  snackBar("Registration successful"),
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
    ));
  }
}
