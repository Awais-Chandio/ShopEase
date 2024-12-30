import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/consts/consts.dart';
import 'package:shop_ease/consts/images.dart';
import 'package:shop_ease/controllers/profile_controller.dart';
import 'package:shop_ease/widgets_common/bg_widget.dart';
import 'package:shop_ease/widgets_common/custom_textfield.dart';
import 'package:shop_ease/widgets_common/our_button.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<ProfileController>();
 
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          //  data["imageUrl"]=="" && controller.profileImgPath.isEmpty
          //       ? Image.asset(
          //           imgProfile2,
          //           width: 100,
          //           fit: BoxFit.cover,
          //         ).box.roundedFull.clip(Clip.antiAlias).make()
          //       :
          //       data["imageUrl"]!="" && controller.profileImgPath.isEmpty? 
          //       Image.network(data["imageUrl"],  width: 100,
          //           fit: BoxFit.cover,
          //         ).box.roundedFull.clip(Clip.antiAlias).make():
                Image.file(
                    File(controller.profileImgPath.value),
                    width: 100,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),
            10.widthBox,
            OurButton(
                onPress: () {
                  controller.ChangeImage(context);
                },
                color: redColor,
                textColor: whiteColor,
                title: "Change"),
            Divider(),
            20.heightBox,
            customTextField(
              controller: controller.nameController,
              hint: nameHint, title: name, isPass: false),
            customTextField(
              controller: controller.passwordController,
              hint: password, title: password, isPass: true),
           controller.isLoading ? CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(redColor),
           ) : SizedBox(
                width: context.screenWidth - 60,
                child: OurButton(
                    onPress: ()async {
                      controller.isLoading = true;
                      await controller.uploadProfileImage();
                      await controller.updateProfile(
                          name: controller.nameController.text,
                          password: controller.passwordController.text,
                          imageUrl: controller.profileImageLink,
                      );
                      VxToast.show(context, msg: "Profile Updated");


                      
                    },
                    color: redColor,
                    textColor: whiteColor,
                    title: "Save"))
          ],
        )
            .box
            .white
            .shadowSm
            .padding(EdgeInsets.all(16))
            .margin(EdgeInsets.only(top: 50, left: 12, right: 12))
            .rounded
            .make(),
      ),
    ));
  }
}
