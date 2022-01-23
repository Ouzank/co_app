// ignore_for_file: unrelated_type_equality_checks

import 'package:co_app/constants/theming.dart';
import 'package:co_app/screens/sign_in_screen.dart';
import 'package:co_app/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class RegistrationScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  bool showSigin = true;
  final AuthenticationServices _auth = AuthenticationServices();
  final TextEditingController numberphoneController = TextEditingController();
  final TextEditingController nomEditingController = TextEditingController();
  final TextEditingController prenomEditingController = TextEditingController();
  final TextEditingController confirmPasswordEditingController =
      TextEditingController();

   int id = 1;
  
  final TextEditingController profpic = TextEditingController(text: 'picture');
  final TextEditingController favmovies = TextEditingController(text: 'action');
  final TextEditingController birthday = TextEditingController(text: '01/01/2000');
  final TextEditingController typeofpers = TextEditingController(text: 'adulte');

  DateTime date = DateTime.now();

  String d = '';
  String m = '';
  String y = '';
  String borndate = '';
  final TextEditingController birthController = TextEditingController();
  Future<Null> selectTimePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(1940),
        lastDate: DateTime(2100));
    if (picked != null && picked != date) {
      date = picked;
      d = date.day.toString();
      m = date.month.toString();
      y = date.year.toString();
      borndate = d + '-' + m + '-' + y;
      birthController.text = borndate;
    }
  }

  final TextEditingController mailCtrl = TextEditingController(),
      pswdCtrl = TextEditingController();
  RegistrationScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RxBool showPassword = false.obs;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const FaIcon(FontAwesomeIcons.angleLeft)),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Créez votre compte.",
              textAlign: TextAlign.start,
              style: GoogleFonts.sora(
                fontSize: 10,
                color: kMainAccentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Bienvenue.\nPrêt pour l'aventure?",
              textAlign: TextAlign.start,
              style: GoogleFonts.andada(
                fontSize: 10,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Nom",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                prefixIcon: const Icon(
                  Icons.person,
                  size: 17,
                ),
                hintText: "Nom",
                hintStyle: GoogleFonts.andada(
                  fontWeight: FontWeight.bold,
                ),
              ),
              controller: nomEditingController,
              validator: (value) => value!.isEmpty ? 'Noms svp' : null,
              onSaved: (value) {
                nomEditingController.text = value!;
              },
            ).px12(),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Prénom",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                prefixIcon: const Icon(
                  Icons.person,
                  size: 17,
                ),
                hintText: "Prénom",
                hintStyle: GoogleFonts.andada(
                  fontWeight: FontWeight.bold,
                ),
              ),
              controller: prenomEditingController,
              validator: (value) => value!.isEmpty ? 'Prénom svp' : null,
              onSaved: (value) {
                prenomEditingController.text = value!;
              },
            ).px12(),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                prefixIcon: const Icon(
                  FontAwesomeIcons.solidEnvelope,
                  size: 17,
                ),
                hintText: " E-mail ",
                hintStyle: GoogleFonts.andada(
                  fontWeight: FontWeight.bold,
                ),
              ),
              controller: mailCtrl,
              validator: (value) => value!.isEmpty ? 'Email svp' : null,
              onSaved: (value) {
                mailCtrl.text = value!;
              },
            ).px12(),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Numéro de tétéphone *",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                prefixIcon: const Icon(
                  Icons.phone_android,
                  size: 17,
                ),
                hintText: "Numéro de téléphone",
                hintStyle: GoogleFonts.andada(
                  fontWeight: FontWeight.bold,
                ),
              ),
              controller: numberphoneController,
              validator: (value) => value!.isEmpty ? 'Prénom svp' : null,
              onSaved: (value) {
                numberphoneController.text = value!;
              },
            ).px12(),
            const SizedBox(
              height: 30,
            ),
            Obx(() => TextFormField(
              textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.visiblePassword,
                  style: const TextStyle(color: Colors.white),
                  obscureText: showPassword.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    hintText: "Mot de passe",
                    prefixIcon: const Icon(
                      FontAwesomeIcons.lock,
                      size: 17,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () => showPassword.toggle(),
                        icon: FaIcon(
                          showPassword.value
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          size: 17,
                        )),
                    hintStyle: GoogleFonts.andada(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  controller: pswdCtrl,
                  validator: (value) =>
                      value!.length < 5 ? 'Mot de passe svp' : null,
                  onSaved: (value) {
                    pswdCtrl.text = value!;
                     profpic.text = 'picture';
                     favmovies.text =
                        'action';
                   birthday.text =
                        '01/01/2000';
                   typeofpers.text = 'adulte';

                  },
                ).px12()),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.visiblePassword,
              style: const TextStyle(color: Colors.white),
              obscureText: showPassword.value,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                hintText: "Retaper mot de passe",
                prefixIcon: const Icon(
                  FontAwesomeIcons.lock,
                  size: 17,
                ),
                suffixIcon: IconButton(
                    onPressed: () => showPassword.toggle(),
                    icon: FaIcon(
                      showPassword.value
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash,
                      size: 17,
                    )),
                hintStyle: GoogleFonts.andada(
                  fontWeight: FontWeight.bold,
                ),
              ),
              controller: confirmPasswordEditingController,
              validator: (value) =>
                  value != pswdCtrl.text ? 'Retaper le meme mot de passe svp' : null,
              onSaved: (value) {
                confirmPasswordEditingController.text = value!;
              },
            ).px12(),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Vous avez déjà un compte?",
                  style: TextStyle(fontSize: 17),
                ),
                TextButton(
                    onPressed: () => Get.off(() => SigninScreen()),
                    child: const Text(
                      "Se connecter",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            GestureDetector(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  
                  _formKey.currentState!.save();
                  dynamic result;

                  result = await _auth.registerWithEmailAndPassword(
                      id,
                      nomEditingController.value.text,
                      prenomEditingController.value.text,
                      mailCtrl.value.text,
                      numberphoneController.value.text,
                      pswdCtrl.value.text,
                      profpic.value.text,
                      favmovies.value.text,
                      birthday.value.text,
                      typeofpers.value.text);
                }
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kMainAccentColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "S'inscrire",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.sora(
                      fontSize: 22,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold),
                ).p12(),
              ).px12(),
            ).centered().p8(),
          ],
        ).py32().px24(),
      ),
      backgroundColor: kPrimaryColor,
    );
  }
}
