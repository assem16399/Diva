import 'package:diva/core/themes/colors.dart';
import 'package:diva/core/themes/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle fontLibreBaskerville24BlackW400 =
      GoogleFonts.libreBaskerville(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.black,
  );

  static TextStyle fontMulish12W400 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font18SemiTransparentBlackW400 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.regular,
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
  static TextStyle font16WhiteW600 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
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
  static TextStyle font14GreyRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.grey,
  );

  static TextStyle font14PinkRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.mainDeepPink,
  );
  static TextStyle font28BlackMedium = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.black,
  );
  static TextStyle font20whiteRegular = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.white,
  );

  static TextStyle font16DarkGrayWithTransparencyW400 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.darkGrayWithTransparency,
  );

  static TextStyle font12DarkGrayW400 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.darkGray,
  );

  static TextStyle font12BlackHalfOpacityW400 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.blackWithHalfOpacity,
  );

  static TextStyle font20BlackW600 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.black,
  );

  static TextStyle font20WhiteW600 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white,
  );

  static TextStyle font16BlackW400 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.black,
  );

  static TextStyle font16BlackW600 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.black,
  );

  static TextStyle font10VibrantPinkishRedColorW400 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.vibrantPinkishRedColor,
  );

  static TextStyle font14WhiteW600 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white,
  );
}
