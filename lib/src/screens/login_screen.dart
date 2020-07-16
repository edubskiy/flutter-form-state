import 'package:flutter/material.dart';
import 'package:flutter_form_state/src/mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  Widget emailField() {
    return TextFormField(
      onSaved: (String value) {
        email = value;
      },
      validator: validateEmail,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget passwordField() {
    return TextFormField(
      onSaved: (String value) {
        password = value;
      },
      validator: validatePassword,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
      // obscureText: true,
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text('Submit'),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25)),
            submitButton(),
          ],
        ),
      ),
    );
  }
}
