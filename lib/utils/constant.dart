import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  /// 0 : DEVELOPMENT
  /// 1 : PRODUCTION
  /// 2 : STAGING

  static const primaryColor = Color.fromRGBO(36, 40, 91, 1);
  static const darkBlue = Color(0xFF24285B);
  static const MaterialColor PrimaryColorDark = MaterialColor(
    0xFF004882,
    <int, Color>{
      50: Color(0xFF004882),
      100: Color(0xFF004882),
      200: Color(0xFF004882),
      300: Color(0xFF004882),
      400: Color(0xFF004882),
      500: Color(0xFF004882),
      600: Color(0xFF004882),
      700: Color(0xFF004882),
      800: Color(0xFF004882),
      900: Color(0xFF004882),
    },
  );

  static const MaterialColor PrimaryColor = MaterialColor(
    0xFF006EC7,
    <int, Color>{
      50: Color(0xFF006EC7),
      100: Color(0xFF006EC7),
      200: Color(0xFF006EC7),
      300: Color(0xFF006EC7),
      400: Color(0xFF006EC7),
      500: Color(0xFF006EC7),
      600: Color(0xFF006EC7),
      700: Color(0xFF006EC7),
      800: Color(0xFF006EC7),
      900: Color(0xFF006EC7),
    },
  );

  static const MaterialColor AccentColor = MaterialColor(
    0xFFCC292A,
    <int, Color>{
      50: Color(0xFFCC292A),
      100: Color(0xFFCC292A),
      200: Color(0xFFCC292A),
      300: Color(0xFFCC292A),
      400: Color(0xFFCC292A),
      500: Color(0xFFCC292A),
      600: Color(0xFFCC292A),
      700: Color(0xFFCC292A),
      800: Color(0xFFCC292A),
      900: Color(0xFFCC292A),
    },
  );

  static Color greyColor = Color(0XFFC5C5C5);
  static Color greyColorDarker = Color(0XFF858585);
  static Color elevatedButtonColor = Color(0XFF24285B);

  static TextStyle textStyle = GoogleFonts.montserrat().copyWith();
  static TextStyle textDetails = GoogleFonts.robotoMono().copyWith();
  static TextStyle custFeeStyle =
      GoogleFonts.nunitoSans(color: Colors.green).copyWith();

  static TextStyle whiteTextStyle = TextStyle(
      fontSize: 14,
      color: Colors.white,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none);

  static TextStyle blacktextStyle = TextStyle(
      fontSize: 14,
      color: Colors.black,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none);

  static TextStyle defaultTextStyle2 = TextStyle(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none,
      fontFamily: Platform.isAndroid ? 'Roboto' : 'SF UI Pro');

  static TextStyle TextDetailsStyle = TextStyle(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none);

  static TextStyle TextDetailsStyle2 = TextStyle(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none,
      fontFamily: Platform.isAndroid ? 'Roboto' : 'SF UI Pro');

  static double? checkDouble(dynamic value) {
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }
}
