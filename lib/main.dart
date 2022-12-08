import 'dart:developer';
import 'package:final_year_project/screens/Services/Plumber.dart';
import 'package:flutter/material.dart';
import 'package:final_year_project/screens/home_page.dart';
import 'dart:developer';
import 'package:final_year_project/screens/helper/helper_function.dart';
import 'package:final_year_project/screens/constants.dart';
import 'package:final_year_project/base1.dart';
import 'package:final_year_project/screens/Admin/show_complaint.dart';
import 'package:final_year_project/screens/home_page.dart';
import 'package:final_year_project/screens/login_page.dart';
import 'package:final_year_project/screens/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:final_year_project/screens/login_page.dart';
import 'package:provider/provider.dart';
import 'package:final_year_project/provider/googlesignin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:final_year_project/screens/chatting_page.dart';
import 'package:final_year_project/screens/NoticeBoard_page.dart';
import 'package:flutter/material.dart';
import 'package:final_year_project/screens/login_page.dart';
import 'package:final_year_project/screens/emergency_page.dart';
import 'package:final_year_project/screens/welcome_page.dart';
import 'package:final_year_project/screens/complaints_main_page.dart';
import 'package:final_year_project/screens/other_complaints_page.dart';
import 'package:final_year_project/screens/BetaTestSection/PiCharts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AndroidInitializationSettings andr_noti_setting =
      AndroidInitializationSettings("@mipmap/ic_launcher");

  DarwinInitializationSettings ios_noti_setting = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestCriticalPermission: true);

  InitializationSettings both_ios_andr_noti_intia_setting =
      InitializationSettings(android: andr_noti_setting, iOS: ios_noti_setting);

  bool? intialized =
      await notification.initialize(both_ios_andr_noti_intia_setting);

  log("Notification $intialized");

  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<GoogleSignInProviderss>(
          create: (context) => GoogleSignInProviderss())
    ],
    child: MaterialApp(
      home: BasePage(),
    ));

class BasePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Neumorphic App',
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        baseColor: Color(0xFFFFFFFF),
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      darkTheme: NeumorphicThemeData(
        baseColor: Color(0xFF3E3E3E),
        lightSource: LightSource.topLeft,
        shadowLightColor: Color.fromARGB(166, 255, 255, 255),
        shadowDarkColor: Colors.black,
        depth: 6,
        intensity: 1,
      ),
      home: BasePage1(),
    );
  }
}

class BasePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Something went wrong"));
          } else {
            return WelcomePage();
          }
        },
      ),
    );
  }
}