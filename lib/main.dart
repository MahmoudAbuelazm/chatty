import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scholar_chat/screens/chat_screen.dart';
import 'firebase_options.dart';
import 'screens/login_screen.dart';
import 'screens/rigester_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScolarChat());
}

class ScolarChat extends StatelessWidget {
  const ScolarChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
      initialRoute: LoginScreen.id,
    );
  }
}
