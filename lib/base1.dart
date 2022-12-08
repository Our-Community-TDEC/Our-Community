// import 'package:final_year_project/screens/Admin/show_complaint.dart';
// import 'package:final_year_project/screens/Complain%20Pages/complain_page.dart';
// import 'package:final_year_project/screens/Services/Plumber.dart';
// import 'package:final_year_project/screens/login_page.dart';
// import 'package:final_year_project/screens/welcome_page.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:final_year_project/screens/emergency_page.dart';

// class base1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser!;
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.all(25),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: SizedBox(
//                     width: 200,
//                     height: 30,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => LogIn()),
//                         );
//                       },
//                       child: Text("LogIn Page"),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: SizedBox(
//                     width: 200,
//                     height: 30,
//                     child: ElevatedButton(
//                       // onPressed: () {  },
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => WelcomePage()),
//                         );
//                       },
//                       child: Text("Welcome Page"),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: SizedBox(
//                     width: 200,
//                     height: 30,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => EmergencyPage()),
//                         );
//                       },
//                       child: Text("Emergency Page"),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: SizedBox(
//                     width: 200,
//                     height: 30,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ComplainPage()),
//                         );
//                       },
//                       child: Text("Complains Page"),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: SizedBox(
//                     width: 200,
//                     height: 30,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Plumber()),
//                         );
//                       },
//                       child: Text("service(Plumber) Page"),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: SizedBox(
//                     width: 200,
//                     height: 30,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => show_complaint()),
//                         );
//                       },
//                       child: Text("Admin Complaint show"),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: SizedBox(
//                     width: 200,
//                     height: 30,
//                     child: ElevatedButton(
//                       onPressed: () => FirebaseAuth.instance.signOut(),
//                       child: Text("Log out"),
//                     ),
//                   ),
//                 ),
//                 Text(user.email!)
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
