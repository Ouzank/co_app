import 'package:co_app/constants/theming.dart';
import 'package:co_app/screens/registration_screen.dart';
import 'package:co_app/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class SigninScreen extends StatelessWidget {
   final AuthenticationServices _auth = AuthenticationServices();
 
  final _formKey = GlobalKey<FormState>();
  final TextEditingController mailCtrl = TextEditingController(),
      pswdCtrl = TextEditingController();
  SigninScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RxBool showPassword = false.obs;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const FaIcon(FontAwesomeIcons.angleLeft)),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Connectez-vous.",
              textAlign: TextAlign.start,
              style: GoogleFonts.sora(
                fontSize: 35,
                color: kMainAccentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Bienvenue.\nVous nous avez manqué.",
              textAlign: TextAlign.start,
              style: GoogleFonts.andada(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
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
                hintText: "Phone, mail or Username",
                hintStyle: GoogleFonts.andada(
                  fontWeight: FontWeight.bold,
                ),
              ),
              controller: mailCtrl,
              onSaved: (value) {
                mailCtrl.text = value!;
              },
            ).px12(),
            const SizedBox(
              height: 30,
            ),
            Obx(() => TextFormField(
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
                   onSaved: (value) {
                    pswdCtrl.text = value!;
                  },
                ).px12()),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Vous n'avez pas de compte?",
                  style: TextStyle(fontSize: 17),
                ),
                TextButton(
                    onPressed: () => Get.off(() => RegistrationScreen()),
                    child: const Text(
                      "S'inscrire",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            GestureDetector(
              onTap: ()async {
                 if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              dynamic result;
      
              result = await _auth.signInWithEmailAndPassword(
                  mailCtrl.text, pswdCtrl.text);
             
              }
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kMainAccentColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Se connecter",
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
