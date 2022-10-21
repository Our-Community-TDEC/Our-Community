import 'package:final_year_project/base1.dart';
import 'package:final_year_project/logic/login_logic.dart';
import 'package:final_year_project/screens/Services/Plumber.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:final_year_project/screens/complain_page.dart';
import 'package:final_year_project/screens/emergency_page.dart';
// import 'package:flutter/material.dart';
import 'package:final_year_project/screens/welcome_page.dart';
import 'package:final_year_project/screens/login_page.dart';
import 'package:provider/provider.dart';
import 'package:final_year_project/provider/googlesignin.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<GoogleSignInProviderss>(
          create: (context) => GoogleSignInProviderss())
    ],
    child: MaterialApp(
      home: BasePage(),
    ),
  ));
}

class BasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Something went wrong"));
          } else if (snapshot.hasData) {
            return base1();
          } else {
            return LogIn();
          }
        },
      ),
    );
  }
}
