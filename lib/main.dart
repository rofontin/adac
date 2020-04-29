import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);

void main() => runApp(MaterialApp(
      title: 'ADAC',
      home: SignInDemo(),
    ));

class SignInDemo extends StatefulWidget {
  @override
  _SignInDemoState createState() => _SignInDemoState();
}

class _SignInDemoState extends State<SignInDemo> {
  GoogleSignInAccount _currentUser;

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
            "images/telaprincipal.png",
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
              RaisedButton(
                onPressed: _handleSignOut,
                child: Text('SAIR'),
              )
            ],
          )
        ],
      );
    } else {
      return Stack(
        children: <Widget>[
          Image.asset(
            "images/telaprincipal.png",
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
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: _handleSignIn,
                      child: Text('ENTRAR', style: TextStyle(fontSize: 20.0, color: Colors.white)),
                      color: Colors.blue,
                    ),
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
