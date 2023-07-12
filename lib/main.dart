import 'package:firebase_core/firebase_core.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:our_community/screens/home_page.dart';
import 'package:our_community/screens/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:provider/provider.dart';
import 'package:our_community/provider/googlesignin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  OneSignal.shared.setAppId("4d1447fb-0709-4976-a922-419498f066e5");

  // Optional: Set other OneSignal parameters
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  // Optional: Prompt the user for push notification permission
  await OneSignal.shared
      .promptUserForPushNotificationPermission(fallbackToSettings: true);

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
          home: BasePage(),
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
        baseColor: Color.fromARGB(255, 169, 34, 34),
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

class BasePage extends StatefulWidget {
  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  bool _userProvidedPrivacyConsent = false;

  @override
  void initState() {
    super.initState();
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      print('Notification opened');
    });

    OneSignal.shared
        .setInAppMessageClickedHandler((OSInAppMessageAction action) {
      print('In app message clicked');
    });

    checkPrivacyConsent();
  }

  Future<void> checkPrivacyConsent() async {
    bool userProvidedPrivacyConsent =
        await OneSignal.shared.userProvidedPrivacyConsent();
    setState(() {
      _userProvidedPrivacyConsent = userProvidedPrivacyConsent;
    });
  }

  Future<void> requestPrivacyConsent() async {
    await OneSignal.shared.consentGranted(true);
    checkPrivacyConsent();
  }

  Future<void> takeNotificationPermission(String message) async {
    // Check if the user has provided privacy consent
    bool userProvidedPrivacyConsent =
        await OneSignal.shared.userProvidedPrivacyConsent();
    if (!userProvidedPrivacyConsent) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Privacy Consent Required'),
            content: Text(
                'Please provide privacy consent to receive notifications.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Grant Consent'),
                onPressed: () {
                  requestPrivacyConsent();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    takeNotificationPermission("final");
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
