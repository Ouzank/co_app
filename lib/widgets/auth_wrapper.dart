import 'package:co_app/screens/home_screen.dart';
import 'package:co_app/screens/loading_screen.dart';
import 'package:co_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthWrapper extends StatelessWidget {
  
  const AuthWrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.active) {
          //!Loading page
          return const LoadingScreen();
        }
        final user = snapshot.data;
        if (user != null) {
          ("user is logged in");
          (user);
          return const HomeScreen();
        } else {
          ("user is not logged in");
          return const LoginScreen();
        }
      },
    );
  }
}
