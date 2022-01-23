import 'package:co_app/constants/theming.dart';
import 'package:co_app/models/user.dart';
import 'package:co_app/screens/profil_pic_screen.dart';
import 'package:co_app/screens/registration_screen.dart';
import 'package:co_app/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
      value: AuthenticationServices().user,
      initialData: null,
      child: MaterialApp(
        title: 'Co App'.toUpperCase(),
        debugShowCheckedModeBanner: false,
        theme: MyTheme().darkTheme,
        home: RegistrationScreen(),
        //const AuthWrapper(),
      ),
    );
  }
}
