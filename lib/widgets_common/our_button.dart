// import 'package:flutter/material.dart';
// import 'package:shop_ease/consts/colors.dart';
// import 'package:shop_ease/consts/consts.dart';
// Widget OurButton({onPress,color,textColor,title}){
//   return ElevatedButton(
//     style: ElevatedButton.styleFrom(
//     backgroundColor: color,
//     padding: EdgeInsets.all(12),
//     shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(0), // Set to 0 for sharp corners
//       ),

//     ),
//     onPressed: (){
//       onPress;

//   }, child: title.text.color(textColor).fontFamily(bold).make());
// }
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:shop_ease/consts/colors.dart';
import 'package:shop_ease/consts/consts.dart';
import 'package:velocity_x/velocity_x.dart';

Widget OurButton({
  required onPress,
  required Color color,
  required Color textColor,
  required String title,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0), // Set to 0 for sharp corners
      ),
    ),
    onPressed: onPress, // Calls onPress directly
    child: title.text.color(textColor).fontFamily(bold).make(),
  );
}
