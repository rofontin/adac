import 'dart:async';

import 'package:adac/TelaMenu.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);

class SignInDemo extends StatefulWidget {
  @override
  _SignInDemoState createState() => _SignInDemoState();
}

class _SignInDemoState extends State<SignInDemo> {
  GoogleSignInAccount _currentUser;

  final RoundedLoadingButtonController _btnController = new RoundedLoadingButtonController();

  @override
  void initState() {
    // TODO: implementar initState.
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  void _doSomething() async {
    Timer(Duration(seconds: 3), () {
        _btnController.success();
        _handleSignIn();
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => TelaMenu()
          )
        );
    });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    if (_currentUser != null) {
      return Stack(
        children: <Widget>[
          Image.asset(
            "images/telainicial.png",
            fit: BoxFit.cover,
            height: 1000.0,
            width: 1000.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListTile(
                leading: GoogleUserCircleAvatar(
                  identity: _currentUser,
                ),
                title: Text(_currentUser.displayName ?? ''),
                subtitle: Text(_currentUser.email ?? ''),
              ),
              RoundedLoadingButton(
                child: Text(
                  'Entrar', 
                  style: TextStyle(
                    color: Colors.white
                    )
                ),
                controller: _btnController,
                onPressed: _doSomething,
              )
            ],
          )
        ],
      );
    } else {
      return Stack(
        children: <Widget>[
          Image.asset(
            "images/telainicial.png",
            fit: BoxFit.cover,
            height: 1000.0,
            width: 1000.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 60.0),
                    child: RoundedLoadingButton(
                      child: Text(
                      'Entrar', 
                      style: TextStyle(
                        color: Colors.white
                      )
                      ),
                      controller: _btnController,
                      onPressed: _doSomething,
                    )
                  )
                ],
              ),
            ],
          )
        ],
      );
    }
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() async {
    _googleSignIn.disconnect();
  }
}
