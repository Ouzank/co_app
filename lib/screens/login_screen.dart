import 'package:co_app/constants/theming.dart';
import 'package:co_app/screens/registration_screen.dart';

import 'package:co_app/widgets/reponsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'sign_in_screen.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: _buildMobileLayout(),
      tablet: _buildTabletLayout(),
      desktop: _buildTabletLayout(),
      xtralarge: _buildTabletLayout(),
    );
  }

  _buildTabletLayout() => Scaffold(
        backgroundColor: kPrimaryColor,
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SvgPicture.asset(
                  "assets/icons/undraw_login_re_4vu2.svg",
                  semanticsLabel: 'Welcome',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "Lorem ipsum.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sora(
                          fontSize: 41,
                          color: kMainAccentColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris ",
                      style: GoogleFonts.sora(
                        fontWeight: FontWeight.normal,
                        color: Colors.white70,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.center,
                    ).px16(),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSignInBtn(),
                        const SizedBox(
                          width: 20,
                        ),
                        _buildRegisterbtn(),
                      ],
                    ).py32()
                  ],
                ).p12(),
              )
            ],
          ).p32(),
        ),
      );
  _buildMobileLayout() => Scaffold(
        backgroundColor: kPrimaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "assets/icons/undraw_login_re_4vu2.svg",
              semanticsLabel: 'Welcome',
              height: 300,
            ).p20(),
            Text(
              "Lorem ipsum.",
              textAlign: TextAlign.center,
              style: GoogleFonts.sora(
                  fontSize: 41,
                  color: kMainAccentColor,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris ",
              style: GoogleFonts.sora(
                fontWeight: FontWeight.normal,
                color: Colors.white70,
                fontSize: 17,
              ),
              textAlign: TextAlign.center,
            ).px16(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSignInBtn(),
                const SizedBox(
                  width: 20,
                ),
                _buildRegisterbtn(),
              ],
            ).py32()
          ],
        ).p20(),
      );
  _buildRegisterbtn() {
    return GestureDetector(
      onTap: () => Get.to(() => RegistrationScreen()),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: kMainAccentColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          "S'inscrire",
          textAlign: TextAlign.center,
          style: GoogleFonts.sora(
              fontSize: 20,
              color: kMainAccentColor,
              fontWeight: FontWeight.bold),
        ).p8(),
      ),
    );
  }

  _buildSignInBtn() {
    return GestureDetector(
      onTap: () => Get.to(() => SigninScreen()),
      child: Container(
        decoration: BoxDecoration(
          color: kMainAccentColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          "Se connecter",
          textAlign: TextAlign.center,
          style: GoogleFonts.sora(
              fontSize: 20, color: kPrimaryColor, fontWeight: FontWeight.bold),
        ).p8(),
      ),
    );
  }
}
