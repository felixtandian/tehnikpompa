import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tehnikpompa/app/modules/loginscreen/views/loginscreen_view.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        builder: (context, snapshot) {
          String version = "";
          if (snapshot.hasData) {
            version = snapshot.data.toString();
            print(version);
          }

          return EasySplashScreen(
            logo: Image.asset(
              'assets/tehnikpompaNameLogo.png',
            ),
            logoWidth: 100,
            loadingText: Text(
              version,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            backgroundColor: Colors.white,
            showLoader: true,
            navigator: '/loginscreen',
            durationInSeconds: 2,
          );
        });
  }
}
