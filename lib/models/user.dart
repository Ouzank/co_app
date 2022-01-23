class AppUser {
  final String uid;
  AppUser(this.uid);
}

class AppUserData {
  final String uid;
  final int id;
  final String nom;
  final String prenom;
  final String email;
  final String phone;
  final String profpic;
  final String favmovies;
  final String birthday;
  final String typeofpers;

  AppUserData({
    this.uid='',
    this.id=0,
    this.nom='',
    this.prenom='',
    this.phone='',
    this.favmovies='',
    this.profpic='',
    this.email='',
    this.birthday='',
    this.typeofpers='',
  });
}
