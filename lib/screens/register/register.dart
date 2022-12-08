import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cPassword = TextEditingController();
  Color gradient_top = Color(0xFF2E2F36);
  Color gradient_bot = Color(0xE02E2F36);

  @override
  Widget build(BuildContext context) {
    snackBar(show_msg) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(show_msg),
        backgroundColor: Colors.blue,
      ));
    }

    void createAccount() async {
      String email1 = emailController.text.toString().trim();
      String password = passwordController.text.toString()..trim();
      String confirmpassword = cPassword.text.toString()..trim();

      if (email1 == "" || password == "" || confirmpassword == "") {
        snackBar("Fill all the field");
      } else if (password != confirmpassword) {
        snackBar("Password And Confirm Password not match!");
      } else {
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: email1, password: password);
          snackBar("Registered successfully");
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            snackBar('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            snackBar('The account already exists for that email.');
          }else if (e.code == 'invalid-email') {
            snackBar('Inavalid Email');
          }else if (e.code == 'operation-not-allowed') {
            snackBar('Account is disabled');
          }
        } catch (e) {
          snackBar(e.toString());
        }
      }
    }

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [gradient_top, gradient_bot],
      )),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Text("EmailId"),
                      TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(),
                          labelText: 'name@example.com',
                          hintText: 'Enter E-Mail ID',
                          suffixIcon: Icon(Icons.alternate_email),
                        ),
                      ),
                      Text("mobile no"),
                      TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter Password',
                          suffixIcon: Icon(Icons.people),
                        ),
                        enableSuggestions: false,
                        autocorrect: false,
                        obscuringCharacter: "●",
                      ),
                      Text("password"),
                      TextField(
                        obscureText: true,
                        controller: cPassword,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(),
                          labelText: 'Mobile No',
                          suffixIcon: Icon(Icons.call),
                          hintText: 'Enter Mobile No',
                        ),
                        enableSuggestions: false,
                        autocorrect: false,
                        obscuringCharacter: "●",
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: RichText(
                          text: TextSpan(
                            text:
                                'By signing up, you are agree to our Terms & condition and privacy policy',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                            children: <TextSpan>[
                              TextSpan(
                                  style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          createAccount();
                        },
                        child: Text(
                          "Registration ",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: RichText(
                          text: TextSpan(
                            text: 'Join us before ',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                            children: <TextSpan>[
                              TextSpan(
                                  style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                            ],
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
    );
  }
}
