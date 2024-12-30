import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unnecessary_import
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/consts/consts.dart';
import 'package:shop_ease/consts/lists.dart';
import 'package:shop_ease/controllers/auth_controller.dart';
import 'package:shop_ease/controllers/profile_controller.dart';
import 'package:shop_ease/services/firestore_services.dart';
import 'package:shop_ease/views/auth_screen/login_screen.dart';
import 'package:shop_ease/views/profile_screen/components/details_card.dart';
import 'package:shop_ease/views/profile_screen/edit_profile_Screen.dart';
import 'package:shop_ease/widgets_common/bg_widget.dart';
// ignore: unnecessary_import
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var controller = Get.put(ProfileController());
    return bgWidget(
        child: Scaffold(
            body: StreamBuilder(
                stream: FirestoreServices.getUser(currentUser!.uid),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor),
                      ),
                    );
                  } else {
                    var data = snapshot.data!.docs[0];
                    return // Add your logic here for when snapshot has data
                        SafeArea(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.edit,
                                  color: whiteColor,
                                )).onTap(
                              () {
                                if (data != null) {
                                  controller.nameController.text =
                                      data['name'] ?? '';
                                  controller.passwordController.text =
                                      data['password'] ?? '';
                                }
                                Get.to(() => EditProfileScreen(
                                      data: data,
                                    ));
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                data["imageUrl"] ==""?
                                Image.asset(
                                  imgProfile2,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ).box.roundedFull.clip(Clip.antiAlias).make():
                                Image.network(
                                  imgProfile2,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ).box.roundedFull.clip(Clip.antiAlias).make() ,
                                10.widthBox,
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    "${data['name']}"
                                        .text
                                        .fontFamily(semibold)
                                        .white
                                        .make(),
                                    5.heightBox,
                                    "${data['email']}".text.white.make(),
                                  ],
                                )),
                                OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        side: BorderSide(
                                      color: whiteColor,
                                    )),
                                    onPressed: () async {
                                      await Get.put(AuthController())
                                          .signoutMethode(context);
                                      Get.offAll(() {
                                        return const LoginScreen();
                                      });
                                    },
                                    child: logout.text
                                        .fontFamily(semibold)
                                        .white
                                        .make())
                              ],
                            ),
                          ),
                          20.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              detailsCard(
                                  width: context.screenWidth / 3.4,
                                  count: data["cart_count"],
                                  title: "In your cart"),
                              detailsCard(
                                  width: context.screenWidth / 3.4,
                                  count: data["wishlist_count"],
                                  title: "In your wishlist"),
                              detailsCard(
                                  width: context.screenWidth / 3.4,
                                  count: data["order_count"],
                                  title: "In your orderlist"),
                            ],
                          ),

                          //buttons section
                          ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext context, index) {
                                    return ListTile(
                                        leading: Image.asset(
                                          profileButtonslistIcons[index],
                                          width: 22,
                                        ),
                                        title: profileButtonsList[index]
                                            .text
                                            .fontFamily(semibold)
                                            .color(darkFontGrey)
                                            .make());
                                  },
                                  separatorBuilder: (context, index) {
                                    return const Divider(
                                      color: lightGrey,
                                    );
                                  },
                                  itemCount: profileButtonsList.length)
                              .box
                              .white
                              .rounded
                              .margin(EdgeInsets.all(12))
                              .padding(EdgeInsets.symmetric(horizontal: 16))
                              .shadowSm
                              .make()
                              .box
                              .color(redColor)
                              .make()
                        ],
                      ),
                    );
                  }
                })));
  }
}
