import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shop_ease/consts/colors.dart';
import 'package:shop_ease/consts/consts.dart';
import 'package:shop_ease/views/auth_screen/login_screen.dart';
import 'package:shop_ease/views/home_screen/home.dart';
// ignore: unused_import
import 'package:shop_ease/views/home_screen/home_screen.dart';
import 'package:shop_ease/widgets_common/applogo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //creating a methode to change screen
  changeScreen() {
    Future.delayed(Duration(seconds: 3), () {
      // Get.to(() => LoginScreen());
      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.to(() => LoginScreen());
        } else
          Get.to(() => Home());
      });
    });
  }

  @override
  void initState() {
    changeScreen();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                icSplashBg,
                width: 300,
              )),
          20.heightBox,
          applogoWidget(),
          10.heightBox,
          appname.text.fontFamily(bold).white.make(),
          appversion.text.white.make(),
          Spacer(),
          credits.text.white.fontFamily(semibold).make(),
          30.heightBox,
          //splash screen ui is completed
        ],
      ),
    );
  }
}
