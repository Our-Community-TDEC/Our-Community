import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:our_community/nuemorphism/border_effect.dart';
import 'package:our_community/nuemorphism/colors.dart';
import 'package:our_community/screens/chat/chatpage.dart';
import 'package:our_community/screens/home_page.dart';
import 'package:our_community/screens/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class Launch extends StatefulWidget {
//   const Launch({super.key});

//   @override
//   State<Launch> createState() => _LaunchState();
// }

// class _LaunchState extends State<Launch> {
//   int index = 0;
//   var theme;
//   bool isDark = false;
//   getPreference() async {
//     var pref = await SharedPreferences.getInstance();
//     isDark = pref.getBool("Theme")!;
//     themeF(isDark);
//   }

//   @override
//   initState() {
//     super.initState();
//     getPreference();
//   }

//    themeF(isDark) {
//     if (isDark) {
//       theme = DarkTheme();
//     } else {
//       
//     }
//     setState(() {});
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: CurvedNavigationBar(
//         height: 60.0,
//         backgroundColor: isDark ? HexColor.background_end : HexColor.Wbackground_color,
//         animationDuration: Duration(milliseconds: 500),
//         color: isDark ? HexColor.background_top : HexColor.Wnavigation_bar_color,
//         items: <Widget>[
//           Icon(Icons.home_work_outlined, size: 30),
//           Icon(Icons.chat_bubble_outline, size: 30),
//           Icon(Icons.account_circle_outlined, size: 30),
//         ],
//         onTap: (selectedIndex) {
//           setState(() {
//             index = selectedIndex;
//           });
//         },
//       ),
//       body: getSelectedWidget(index: index),
//     );
//   }

//   Widget getSelectedWidget({required int index}) {
//     final user = FirebaseAuth.instance.currentUser!;
//     String email = user.email!;
//     Widget widget;
//     switch (index) {
//       case 0:
//         widget = HomePage();
//         break;
//       case 1:
//         widget = chatpage(email: email);
//         break;
//       case 2:
//         widget = Profile();
//         break;
//       default:
//         widget = HomePage();
//         break;
//     }
//     return widget;
//   }
// }