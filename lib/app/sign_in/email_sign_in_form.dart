// @dart=2.9
import 'package:flutter/material.dart';
import 'package:edcapp/custom_widgets/form_submit_button.dart';
import 'package:edcapp/services/auth.dart';

enum EmailSignInFormType { signIn, register }

class EmailSignInForm extends StatefulWidget {
  EmailSignInForm({@required this.auth});
  final AuthBase auth;
  // const EmailSignInForm({Key? key}) : super(key: key);

  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String get _email=>_emailController.text;
  String get _password=>_passwordController.text;
  EmailSignInFormType _formType = EmailSignInFormType.signIn;

  void _submit() async{
//todo print email
  try {
    if (_formType == EmailSignInFormType.signIn) {
      await widget.auth.signInWithEmailAndPassword(_email, _password);
    } else {
      await widget.auth.createUserWithEmailAndPassword(_email, _password);
    }
    Navigator.of(context).pop();
  }catch(e){
    print(e.toString());
  }
  }

  void _toggleFormType(){
    setState(() {
      _formType=_formType==EmailSignInFormType.signIn?EmailSignInFormType.register:EmailSignInFormType.signIn;
    });
    _emailController.clear();
    _passwordController.clear();
  }

//  const EmailSignInForm({Key? key}) : super(key: key);
  List<Widget> _buildChildren() {
    final primaryText = _formType == EmailSignInFormType.signIn
        ? 'Sign in'
        : 'create an account';
    final secondaryText = _formType == EmailSignInFormType.signIn
        ? 'need an account? Register'
        : 'have an account?sign in';
    return [
      TextField(
        controller: _emailController,
        decoration:
            InputDecoration(labelText: 'Email', hintText: "test@test.com"),
        // onChanged: (value)=>email=value,
      ),
      SizedBox(height: 8.0),
      TextField(
        controller: _passwordController,
        decoration: InputDecoration(
          labelText: 'password',
        ),
        obscureText: true,
      ),
      SizedBox(height: 8.0),
      FormSubmitButton(
        text: primaryText,
        onPressed: _submit,
      ),
      FlatButton(
        child: Text(secondaryText),
        onPressed: _toggleFormType,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren(),
      ),
    );
  }
}
