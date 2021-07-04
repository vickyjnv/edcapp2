// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:edcapp/services/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key, @required this.auth, @required this.onSignOut}) : super(key: key);
  final AuthBase auth;
  final VoidCallback onSignOut;
  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      onSignOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          FlatButton(
            onPressed: _signOut,
            child: Text(
              'logout',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
