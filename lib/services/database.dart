import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:co_app/models/user.dart';

class DatabaseService {
  final String uid;

  DatabaseService(this.uid);

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  Future<void> saveUser(int id,
      String nom, String prenom, String email,String phone,String profpic,String favmovies,String birthday,String typeofpers) async {
    return await userCollection.doc(uid).set(
        {'id':id,'nom': nom, 'prenom': prenom, 'email': email,
      'birthday': birthday, 'phone': phone, 'profic':profpic,'favmovies':favmovies,'typeofpers':typeofpers
    });
  }

  AppUserData _userFromSnapshot(snapshot) {
    return AppUserData(
        uid: uid,
        id:snapshot.data()['id'],
        nom: snapshot.data()['nom'],
        prenom: snapshot.data()['prenom'],
        phone: snapshot.data()['phone'],
        typeofpers: snapshot.data()['typeofpers'],
        profpic: snapshot.data()['profpic'],
        favmovies: snapshot.data()['favmovies'],
        birthday: snapshot.data()['birthday'],
        email: snapshot.data()['email']);
        
  }

  List<AppUserData> _userListFromSnapshot(snapshot) {
    return snapshot.docs.map((doc) {
      return _userFromSnapshot(doc);
    });
  }

  Stream<AppUserData> get user {
    return userCollection.doc(uid).snapshots().map(_userFromSnapshot);
  }

  Stream<List<AppUserData>> get users {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }
}
