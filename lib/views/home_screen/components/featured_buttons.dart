import 'package:flutter/material.dart';
import 'package:shop_ease/consts/consts.dart';
Widget featuredButton({String? title,Icon}){
  return Row(children: [
    Image.asset(Icon,width: 60,fit: BoxFit.fill,),
    10.widthBox,
    title!.text.fontFamily(semibold).color(darkFontGrey).make()
    
  ],).box.width(200).padding(EdgeInsets.all(4)).margin(EdgeInsets.symmetric(horizontal: 4)).roundedSM.white.outerShadowSm.make();


}