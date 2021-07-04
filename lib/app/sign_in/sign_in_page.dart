// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:edcapp/app/sign_in/sign_in_button.dart';
import 'package:edcapp/app/sign_in/social_sign_in_button.dart';
import 'package:edcapp/custom_widgets/custom_raised_button.dart';
import 'package:edcapp/services/auth.dart';

import 'email_sign_in_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({
    Key key,
    @required this.auth,
  }) : super(key: key);

  final AuthBase auth;

  Future<void> _signInAnonymously() async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(auth: auth),
      ),
    );
    //to do show email sign in page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('edc app'),
        elevation: 2.0,
      ),
      body: _buildContent(context),
      backgroundColor: Colors.grey[400],
    );
  }

  @override
  Widget _buildContent(BuildContext context) {
    return Padding(
      //color: Colors.orange,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'images/images/edc-logo.png',
            width: 200,
            height: 200,
          ),
          Text(
            'Sign In',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 48.0,
          ),
          SocialSignInButton(
            assetName: 'images/images/google-logo.png',
            text: 'sign in with google',
            textColor: Colors.black87,
            color: Colors.white,
            //borderRadius: 4.0,
            onPressed: _signInWithGoogle,
          ),
          SizedBox(
            height: 8.0,
          ),
          SocialSignInButton(
            assetName: 'images/images/facebook-logo.png',
            text: 'sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: () {},
          ),
          SizedBox(
            height: 8.0,
          ),
          SignInButton(
            text: 'sign in with email',
            textColor: Colors.white,
            color: Colors.teal[700],
            onPressed: () => _signInWithEmail(context),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            'or',
            style: TextStyle(fontSize: 14.0, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8.0,
          ),
          SignInButton(
            text: 'Go annonymous',
            textColor: Colors.white,
            color: Colors.lime[700],
            onPressed: _signInAnonymously,
          ),
        ],
      ),
    );
  }
}
