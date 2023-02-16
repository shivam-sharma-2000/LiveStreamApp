import 'package:flutter/material.dart';
import 'package:ombre_assignment/utils/authentication.dart';
import 'package:ombre_assignment/widgets/GoogleSignInButton.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 20.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FutureBuilder(
                    future: Authentication.initializeFirebase(context: context),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error.toString());
                        return Text('Error initializing Firebase');
                      } else if (snapshot.connectionState == ConnectionState.done) {
                        return GoogleSignInButton();
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
/**
 * FloatingActionButton.extended(
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
    label: Text("Sign in with Google"),
    )
 */