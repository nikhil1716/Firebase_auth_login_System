import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class forgotPassword extends StatefulWidget {
  const forgotPassword({Key? key}) : super(key: key);

  @override
  _forgotPasswordState createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  TextEditingController rr = TextEditingController();
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
              "SignUp Page",
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
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  _auth.sendPasswordResetEmail(email: rr.text);
                },
                child: Text("Send mail")),
          ],
        ),
      ),
    ));
  }

  // register() async {
  //   print("Register");
  //   try {
  //     UserCredential userCred =
  //         await _auth.sendPasswordResetEmail(email: rr.text);
  //     if (userCred.user != null) {
  //       print(userCred.user!.uid);
  //       await userCred.user!.sendEmailVerification();
  //     } else {
  //       print("issue creating an user ${userCred}");
  //     }
  //   } catch (ex) {
  //     print("Exception ${ex.toString()}");
  //   }
  // }
}
