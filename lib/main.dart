// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:edcapp/app/landing_page.dart';
import 'package:edcapp/app/sign_in/sign_in_page.dart';
import 'package:edcapp/services/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'time tracker',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: LandingPage(
        auth: Auth(),
      ),
    );
  }
}
