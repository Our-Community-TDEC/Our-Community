import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:our_community/screens/home_page.dart';
import 'package:our_community/screens/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:our_community/provider/googlesignin.dart';

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
  // bool? intialized =
  // await notification.initialize(both_ios_andr_noti_intia_setting);

  // log("Notification $intialized");

  await Firebase.initializeApp();
  runApp(
    // A provider that merges multiple providers into a single linear widget tree.
    MultiProvider(
        providers: [
          // A wrapper around InheritedWidget to make them easier to
          //use and more reusable.So here we are Inheriting GoogleSignInProviderss
          ChangeNotifierProvider<GoogleSignInProviderss>(
              create: (context) => GoogleSignInProviderss())
        ],
        // MaterialApp is a widget that introduces a number of widgets Navigator, 
        //Theme that are required to build a material design app.
        child: MaterialApp(
          home: BasePage1(),
        )),
  );
}

class BasePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use for theme
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
      home: BasePage(),
    );
  }
}

class BasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // StreamBuilder is a widget that builds itself based on the latest snapshot of interaction with a stream.
      // Ex. chat application clock applications where the widget needs to rebuild itself to show the current snapshot of data.
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // 
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