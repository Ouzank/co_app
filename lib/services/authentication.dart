// ignore_for_file: unnecessary_null_comparison


import 'package:co_app/models/user.dart';
import 'package:co_app/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthenticationServices {


  final FirebaseAuth _auth = FirebaseAuth.instance;
  AppUser? _userFromFirebaseUser(user){
    return user != null ? AppUser(user.uid) : null;
  }

  
  // void initUser(User? user) async {
  //   if (user == null) return;
  //   NotificationService.getToken().then((value) {
  //     DatabaseService(user.uid).saveToken(value);
  //   });
  // }

  Stream<AppUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result =
       await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword( 
      int id,
      String nom,
      String prenom,
      String email,
      String phone,
      String password,
      String profpic,
      String favmovies,
      String birthday,
      String typeofpers) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      await DatabaseService(user!.uid).saveUser(id,
      nom,
      prenom,
      email,
      phone,
      profpic,
      favmovies,
      birthday,
      typeofpers);

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
