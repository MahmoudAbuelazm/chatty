import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/widgets/custom_button.dart';

import '../helper/show_snack_bar.dart';
import '../widgets/custom_textfield.dart';
import 'chat_screen.dart';
import 'rigester_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;

  String? password;
  bool isloding = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return ModalProgressHUD(
      inAsyncCall: isloding,
      child: Scaffold(
        backgroundColor: const Color(0xff2B475E),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
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
                CustomFormTextField(
                  hint: "Email",
                  onChanged: (value) {
                    email = value;
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomFormTextField(
                  isPassword: true,
                  hint: "Password",
                  onChanged: (value) {
                    password = value;
                  },
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                CustomElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      isloding = true;
                      setState(() {});
                      try {
                        await loginUser();
                        showSnackBar(context, 'Successfully Registered');
                        Navigator.pushNamed(context, ChatScreen.id,arguments: email);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackBar(
                              context, 'No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(context,
                              'Wrong password provided for that user.');
                        }
                      } catch (e) {
                        showSnackBar(context, 'Error occured');
                      }
                      isloding = false;
                      setState(() {});
                    } else {
                      showSnackBar(context, 'Please fill the form correctly');
                    }
                  },
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
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.signInWithEmailAndPassword(
        email: email!, password: password!);
  }
}
