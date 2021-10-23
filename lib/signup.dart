import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  register();
                },
                child: Text("Register")),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    ));
  }

  register() async {
    print("register");

    try {
      UserCredential userCred = await _auth.createUserWithEmailAndPassword(
          email: rr.text, password: kk.text);
      if (userCred.user != null) {
        print(userCred.user!.uid);
        await userCred.user!.sendEmailVerification();
      } else {
        print("issue creating an user ${userCred}");
      }
    } catch (ex) {
      print("exception${ex.toString()}");
    }
  }
}
