import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitz/constants/color.dart';

class AppTextStyles {
  static TextStyle smallWhite = GoogleFonts.openSans().copyWith(
    fontSize: 10.sp,
    color: AppColors.primary,
  );
  static TextStyle mediumWhite = GoogleFonts.openSans().copyWith(
    fontSize: 16.sp,
    color: AppColors.primary,
  );
  static TextStyle largeWhite = GoogleFonts.openSans().copyWith(
    fontSize: 28.sp,
    color: AppColors.primary,
  );
  static TextStyle smallBlack = GoogleFonts.openSans().copyWith(
    fontSize: 10.sp,
    color: AppColors.secondary,
  );
  static TextStyle mediumBlack = GoogleFonts.openSans().copyWith(
    fontSize: 16.sp,
    color: AppColors.secondary,
  );
  static TextStyle largeBlack = GoogleFonts.openSans().copyWith(
    fontSize: 28.sp,
    color: AppColors.secondary,
  );
  static TextStyle smallWhiteBold = GoogleFonts.openSans().copyWith(
    fontSize: 10.sp,
    color: AppColors.primary,
    fontWeight: FontWeight.bold,
  );
  static TextStyle mediumWhiteBold = GoogleFonts.openSans().copyWith(
    fontSize: 16.sp,
    color: AppColors.primary,
    fontWeight: FontWeight.bold,
  );
  static TextStyle largeWhiteBold = GoogleFonts.openSans().copyWith(
    fontSize: 28.sp,
    color: AppColors.primary,
    fontWeight: FontWeight.bold,
  );
  static TextStyle smallBlackBold = GoogleFonts.openSans().copyWith(
    fontSize: 10.sp,
    color: AppColors.secondary,
    fontWeight: FontWeight.bold,
  );
  static TextStyle mediumBlackBold = GoogleFonts.openSans().copyWith(
    fontSize: 16.sp,
    color: AppColors.secondary,
    fontWeight: FontWeight.bold,
  );
  static TextStyle largeBlackBold = GoogleFonts.openSans().copyWith(
    fontSize: 28.sp,
    color: AppColors.secondary,
    fontWeight: FontWeight.bold,
  );
  static TextStyle error = GoogleFonts.openSans().copyWith(
    fontSize: 16.sp,
    color: AppColors.error,
  );
}
