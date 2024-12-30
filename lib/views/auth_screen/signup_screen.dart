import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shop_ease/consts/consts.dart';
// ignore: unused_import
import 'package:shop_ease/consts/lists.dart';
import 'package:shop_ease/controllers/auth_controller.dart';
// ignore: unused_import
import 'package:shop_ease/controllers/home_controller.dart';
// ignore: unused_import
import 'package:shop_ease/views/auth_screen/login_screen.dart';
import 'package:shop_ease/views/home_screen/home.dart';
import 'package:shop_ease/widgets_common/applogo_widget.dart';
import 'package:shop_ease/widgets_common/bg_widget.dart';
import 'package:shop_ease/widgets_common/custom_textfield.dart';
import 'package:shop_ease/widgets_common/our_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
              child: Column(
                children: [
                  (context.screenHeight * 0.1).heightBox,
                  applogoWidget(),
                  10.heightBox,
                  "Join the $appname"
                      .text
                      .fontFamily(bold)
                      .size(18)
                      .white
                      .make(),
                  15.heightBox,
                  Column(
                    children: [
                      customTextField(
                          hint: nameHint,
                          title: name,
                          controller: nameController,
                          isPass: false),
                      customTextField(
                          hint: emailHint,
                          title: email,
                          controller: emailController,
                          isPass: false),
                      customTextField(
                          hint: passwordHint,
                          title: password,
                          controller: passwordController,
                          isPass: true),
                      customTextField(
                        hint: passwordHint,
                        title: reTypePass,
                        controller: passwordRetypeController,
                        isPass: true,
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {}, child: forgetpass.text.make())),
                      // OurButton().box.width(context.screenWidth-50).make()

                      SingleChildScrollView(
                        child: Row(
                          children: [
                            Checkbox(
                                checkColor: whiteColor,
                                activeColor: redColor,
                                value: isCheck,
                                onChanged: (newValue) {
                                  setState(() {
                                    isCheck = newValue;
                                  });
                                }),
                            5.widthBox,
                            Expanded(
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "I agree to the ",
                                    style: TextStyle(
                                        fontFamily: regular, color: fontGrey)),
                                TextSpan(
                                    text: termAndConditions,
                                    style: TextStyle(
                                        fontFamily: regular, color: redColor)),
                                TextSpan(
                                    text: " & ",
                                    style: TextStyle(
                                        fontFamily: regular, color: redColor)),
                                TextSpan(
                                    text: privacyPolicy,
                                    style: TextStyle(
                                        fontFamily: regular, color: redColor)),
                              ])),
                            )
                          ],
                        ),
                      ),
                      OurButton(
                          color: isCheck == true ? redColor : lightGrey,
                          title: signup,
                          textColor: whiteColor,
                          onPress: () async {
                            if (isCheck != false) {
                              controller.isLoading(true);
                              try {
                                await controller.SignUpMethode(
                                  context: context,
                                  email: emailController.text,
                                  password: passwordController.text,
                                ).then((Value) {
                                  return controller.StoreUserData(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text);
                                }).then((Value) {
                                  VxToast.show(context, msg: loggedIn);
                                  Get.offAll(() => const Home());
                                });
                              } catch (e) {
                                auth.signOut();
                                VxToast.show(context, msg: e.toString());
                                controller.isLoading(false);
                              }
                            }
                          }).box.width(context.screenWidth - 50).make(),
                      10.heightBox,
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: alreadyHaveAccount,
                            style:
                                TextStyle(fontFamily: bold, color: fontGrey)),
                        TextSpan(
                            text: login,
                            style: TextStyle(fontFamily: bold, color: redColor))
                      ])).onTap(() {
                        Get.back();
                      })
                    ],
                  )
                      .box
                      .white
                      .rounded
                      .padding(EdgeInsets.all(16))
                      .width(context.screenWidth - 70)
                      .shadowSm
                      .make(),
                ],
              ),
            )));
  }
}
