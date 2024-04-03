import 'dart:ui';

import 'package:flutter/material.dart';

class Mytheme {
  static Color primarycolor = const Color(0xff39A552);
  static Color bluecolor = const Color(0xff42505C);
  static Color priblucolor = const Color(0xff003E90);

  static Color Binkcolor = const Color(0xffED1E79);
  static Color browncolor = const Color(0xffCF7E48);
  static Color yellowcolor = const Color(0xffF2D352);
  static Color smawycolor = const Color(0xff4882CF);
  static Color graycolor = const Color(0xffC8C9CB);
  static Color redcolor = const Color(0xffC91C22);
  static Color whiteycolor = const Color(0xffFFFFFF);
  static Color blackcolor = const Color(0xff303030);
  static Color primarydarkcolor = const Color(0xff060E1E);
  static Color primarydarkcolorbar = const Color(0xff141922);

  ThemeData lighttheme = ThemeData(
    primaryColor: primarycolor,
    appBarTheme: AppBarTheme(
        color: primarycolor,
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ))),
    textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: whiteycolor),
        titleMedium: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: whiteycolor),
        titleSmall: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: whiteycolor)),
  );
}
