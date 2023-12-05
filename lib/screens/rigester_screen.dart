import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  static String id = 'register_screen';
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff2B475E),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(
              height: height * 0.2,
            ),
            Image.asset(
              'assets/images/scholar.png',
              height: 100,
            ),
            SizedBox(
              height: height * 0.005,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Scolar Chat",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Pacifico'),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const Row(
              children: [
                Text(
                  "REGISTER",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            CustomTextField(
              hint: "Email",
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(
              height: height * 0.02,
            ),
            CustomTextField(
              onChanged: (value) {
                password = value;
              },
              hint: "Password",
            ),
            SizedBox(
              height: height * 0.05,
            ),
            CustomElevatedButton(
              onPressed: () async {
                var auth = FirebaseAuth.instance;
                UserCredential user =await auth.createUserWithEmailAndPassword(
                    email: email!, password: password!);
              },
              text: "Register",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "alreay have an account?",
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("login",
                      style: TextStyle(color: Color(0xffC7EDE6))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
