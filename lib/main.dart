import 'package:flutter/material.dart';
import 'screens/welcome_back_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/check_email_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth UI Kit',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
      ),
      home: WelcomeBackScreen(),
      routes: {
        '/forgot': (_) => ForgotPasswordScreen(),
        '/check_email': (_) => CheckEmailScreen(),
      },
    );
  }
}
