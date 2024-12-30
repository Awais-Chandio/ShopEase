import 'package:flutter/material.dart';
import 'package:shop_ease/consts/consts.dart';
Widget HomeButton({height,width,onPress,icon, String? title}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(icon,width: 26,),
      10.heightBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make(),
    ],
  ).box.rounded.size(width, height).shadowSm.white.make();
}