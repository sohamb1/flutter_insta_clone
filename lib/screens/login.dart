import 'package:feedup/constants.dart';
import 'package:feedup/utilities/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text('Hello\nThere',
                          style: TextStyle(
                              fontSize: 64,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      Text('.',
                          style: TextStyle(
                              fontSize: 64,
                              color: Colors.green,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 24.0),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your email.';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'EMAIL',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: 16),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey))),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your password.';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'PASSWORD',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: 16),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey))),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => print('Forgot Password Clicked'),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                          alignment: Alignment.centerRight,
                          child: Text('Forgot Password?',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))),
                    ),
                  ),
                  SizedBox(height: 48.0),
                  FlatButton(
                    highlightColor: Colors.transparent,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                         print('Login Success');
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(
                                color: Colors.green,
                                width: 1.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(30.0)),
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
                        child: Text(
                          'Log in',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      )),
                  SizedBox(height: 18.0),
                  FlatButton(
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        Navigator.pushNamed(context, homeRoute);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black,
                                width: 1.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(30.0)),
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
                        child: Text(
                          'Log in in with Facebook',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      )),
                  SizedBox(height: 48.0),
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('New to FeedUp?',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18)),
                          SizedBox(width: 8.0),
                          Text('Register',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontSize: 18)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
