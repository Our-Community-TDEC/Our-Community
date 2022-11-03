import 'package:final_year_project/base1.dart';
import 'package:final_year_project/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LogIn()),
          );
        },
        child: Icon(Icons.arrow_back),
      ),
      backgroundColor: Colors.grey[800],
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Image.asset(
                    'assets/Images/Welcome/WelcomeImage.png',
                    width: 400,
                  ),
                ),
                // ignore: prefer_const_literals_to_create_immutables
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore:
              children: [
                SizedBox(
                  width: 400,
                  height: 338,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Welcome, To",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "Community",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(4, 5, 0, 0),
                          child: const Text(
                            "Let's Get Started",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 259,
                  height: 78,
                  child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.grey[600],
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(44),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LogIn()),
                            );
                          },
                          child: const Text(
                            "Get Started",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
