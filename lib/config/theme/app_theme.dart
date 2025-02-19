import 'package:cleanarch/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData get theme =>
   ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: GoogleFonts.aBeeZee().fontFamily,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.greyColor),
      titleTextStyle: const TextStyle(color: AppColors.greyColor, fontSize: 18),
    ),
  );

