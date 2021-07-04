// @dart=2.9
import 'package:flutter/material.dart';
import 'package:edcapp/services/auth.dart';
import 'email_sign_in_form.dart';

class EmailSignInPage extends StatelessWidget {
  EmailSignInPage({@required this.auth});
  final AuthBase auth;
  //const EmailSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        elevation: 2.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: EmailSignInForm(
            auth: auth,
          ),
        ),
      ),
      backgroundColor: Colors.grey[400],
    );
  }
}
