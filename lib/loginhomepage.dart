import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:loginpage/forgotpassword.dart';
import 'package:loginpage/homeScreen.dart';
import 'package:loginpage/signup.dart';

class Loginhomepage extends StatefulWidget {
  const Loginhomepage({Key? key}) : super(key: key);

  @override
  _LoginhomepageState createState() => _LoginhomepageState();
}

class _LoginhomepageState extends State<Loginhomepage> {
  TextEditingController rr = TextEditingController();
  TextEditingController kk = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Text(
              "Login Page",
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: rr,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Color(0xFFe7edeb),
                    hintText: "E-mail",
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.grey[600],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: kk,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Color(0xFFe7edeb),
                    hintText: "Password",
                    prefixIcon: Icon(
                      Icons.password_rounded,
                      color: Colors.grey[600],
                    )),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => forgotPassword()));
                      },
                      child: Text(
                        "Forgot password",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      )),
                )
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => HomeScreen()));
                  Login();
                },
                child: Text("Login")),
            SizedBox(
              height: 100,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupPage()));
              },
              child: Text(
                "Already Have an Account? Sign in",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Login() async {
    print("object");

    try {
      UserCredential userCred = await _auth.signInWithEmailAndPassword(
          email: rr.text, password: kk.text);
      if (userCred.user != null) {
        print(userCred.user!.uid);
        print("isemailverified${userCred.user!.emailVerified}");
      } else {
        print("issue creating an user ${userCred}");
      }
    } catch (ex) {
      print("exception${ex.toString()}");
      SnackBar snack = SnackBar(
        content: Text(ex.toString()),
        backgroundColor: Colors.purple,
        behavior: SnackBarBehavior.fixed,
      );
      ScaffoldMessenger.of(context).showSnackBar(snack);
    }
  }
}
