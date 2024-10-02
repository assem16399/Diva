import 'package:diva/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle fontLibreBaskerville24BlackW400 =
      GoogleFonts.libreBaskerville(
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static TextStyle fontMulish12W400 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle font18SemiTransparentBlackW400 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.semiTransparentBlack,
  );

  static TextStyle font18BlackW400 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static TextStyle font18WhiteW400 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle font14BlackW400 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static TextStyle font14MainDeepPinkW400 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.mainDeepPink,
  );

  static TextStyle font18BlackWithOpacityW400 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: Colors.black.withOpacity(0.4),
  );

  static TextStyle font16DarkGrayWithTransparencyW400 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.darkGrayWithTransparency,
  );

  static TextStyle font12DarkGrayW400 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.darkGray,
  );

  static TextStyle font12BlackHalfOpacityW400 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.blackWithHalfOpacity,
  );

  static TextStyle font20BlackW600 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
}
