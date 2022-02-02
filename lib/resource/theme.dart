import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = Color(0xff1D3160);
  static const MaterialColor primarySwatchColor = MaterialColor(
    0xff000000,
    <int, Color>{
      50: Color(0xff000000),
      100: Color(0xff000000),
      200: Color(0xff000000),
      300: Color(0xff000000),
      400: Color(0xff000000),
      500: Color(0xff000000),
      600: Color(0xff000000),
      700: Color(0xff000000),
      800: Color(0xff000000),
      900: Color(0xff000000),
    },
  );
  static const Color primaryColorConst = Color(0xff1D3160);
  static Color secondaryColor = Color(0xffC12037);
  static Color primaryFontColor = Colors.black;
  static Color secondaryFontColor = Colors.white;
  static Color successFontColor = Color(0xff28B446);
  static Color errorFontColor = Color(0xffC12037);
  static final ThemeData primaryTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    textTheme: TextTheme(
        bodyText2: TextStyle(
      color: primaryFontColor,
    )),
    primarySwatch: primarySwatchColor,
    unselectedWidgetColor: Color(0xff8592E5),
    //appBarTheme: AppBarTheme(backgroundColor: primaryColor)
  );
}
