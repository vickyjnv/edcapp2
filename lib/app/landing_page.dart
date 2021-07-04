// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:edcapp/app/home_page.dart';
import 'package:edcapp/app/sign_in/sign_in_page.dart';
import 'package:edcapp/services/auth.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;



  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User user = snapshot.data;
          if (user == null) {
            return SignInPage(
              auth: auth,
              //onSignIn: _updateUser,
            );
          }
          return HomePage(
            auth: auth,
            //onSignOut: () => _updateUser(null),
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
