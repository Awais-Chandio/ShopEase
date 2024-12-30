import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shop_ease/consts/consts.dart';
import 'package:shop_ease/consts/lists.dart';
import 'package:shop_ease/controllers/auth_controller.dart';
import 'package:shop_ease/views/auth_screen/signup_screen.dart';
import 'package:shop_ease/views/home_screen/home.dart';
//import 'package:shop_ease/views/signup_screen.dart';
import 'package:shop_ease/widgets_common/applogo_widget.dart';
import 'package:shop_ease/widgets_common/bg_widget.dart';
import 'package:shop_ease/widgets_common/custom_textfield.dart';
import 'package:shop_ease/widgets_common/our_button.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return bgWidget(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
              child: Column(
                children: [
                  (context.screenHeight * 0.1).heightBox,
                  applogoWidget(),
                  10.heightBox,
                  "Log in to $appname"
                      .text
                      .fontFamily(bold)
                      .size(18)
                      .white
                      .make(),
                  15.heightBox,
                  Obx(
                    () => Column(
                      children: [
                        customTextField(
                            hint: emailHint,
                            title: email,
                            isPass: false,
                            controller: controller.emailController),
                        customTextField(
                            hint: passwordHint,
                            title: password,
                            isPass: true,
                            controller: controller.passwordController),
                        Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {},
                                child: forgetpass.text.make())),
                        // OurButton().box.width(context.screenWidth-50).make()

                        controller.isLoading.value
                            ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(redColor),
                              )
                            : OurButton(
                                color: redColor,
                                title: login,
                                textColor: whiteColor,
                                onPress: () async {
                                  controller.isLoading(true);
                                  await controller.LoginMethode(
                                          context: context)
                                      .then((value) {
                                    if (value != null) {
                                      VxToast.show(context, msg: loggedIn);
                                      Get.offAll(() {
                                        return Home();
                                      });
                                    } else
                                      controller.isLoading(false);
                                  });
                                }).box.width(context.screenWidth - 50).make(),
                        5.heightBox,
                        createNewAccount.text.color(fontGrey).make(),
                        5.heightBox,
                        OurButton(
                            color: ligtGolden,
                            title: signup,
                            textColor: redColor,
                            onPress: () {
                              Get.to(() => SignupScreen());
                            }).box.width(context.screenWidth - 50).make(),
                        10.heightBox,
                        loginWith.text.color(fontGrey).make(),
                        5.heightBox,
                        // Row(children: [
                        //   List.generate(3,(index)=>CircleAvatar(

                        //     child: Image.asset(SocialIconList[index]),

                        //   ))
                        // ],)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            3,
                            (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: lightGrey,
                                child: Image.asset(
                                  SocialIconList[index],
                                  width: 30,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                        .box
                        .white
                        .rounded
                        .padding(EdgeInsets.all(16))
                        .width(context.screenWidth - 70)
                        .shadowSm
                        .make(),
                  ),
                ],
              ),
            )));
  }
}
