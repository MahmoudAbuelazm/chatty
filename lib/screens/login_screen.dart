import 'package:flutter/material.dart';
import 'package:scholar_chat/widgets/custom_button.dart';

import '../widgets/custom_textfield.dart';
import 'rigester_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    Key? key,
  }) : super(key: key);

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
                  "LOGIN",
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
            ),
            SizedBox(
              height: height * 0.02,
            ),
             CustomTextField(
              hint: "Password",
            ),
            SizedBox(
              height: height * 0.05,
            ),
             CustomElevatedButton(
              onPressed: (){},
              text: "Login",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterScreen.id);
                  },
                  child: const Text("Sign Up",
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
