import 'package:flutter/material.dart';
import 'package:shop_ease/consts/consts.dart';

import 'applogo_widget.dart';
import 'package:shop_ease/consts/colors.dart';

Widget bgWidget({Widget? child}){
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(imgBackground),fit: BoxFit.fill),  
    ),
    child: child,

  );
}