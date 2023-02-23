import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:masrofat/pages/signin.dart';
import 'package:masrofat/pages/signup.dart';
import 'pages/homepage.dart';
const String emaila = "tony@starkindustries.com";
final bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
    .hasMatch(emaila);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'signin' : (context) => const SignIn(),
        'home' : (context) => const HomePage(),
        'SignUp' : (context) => const SignUp(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Masrofat',
      theme: ThemeData(),
      home: const HomePage(),
    );
    
  }
}
