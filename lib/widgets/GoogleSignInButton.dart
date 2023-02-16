import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ombre_assignment/ui/home_page.dart';
import 'package:ombre_assignment/utils/authentication.dart';

class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: _isSigningIn
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            : Center(
              child: FloatingActionButton.extended(
                  label: Text("Sign In With Google"),
                  icon: Icon(Icons.g_mobiledata),
                  onPressed: () async {
                    setState(() {
                      _isSigningIn = true;
                    });

                    User? user =
                        await Authentication.signInWithGoogle(context: context);

                    setState(() {
                      _isSigningIn = false;
                    });

                    if (user != null) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    }
                  },
                ),
            ));
  }
}
