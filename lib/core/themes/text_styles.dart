import 'package:diva/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Font_Weight_Helper.dart';

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
}
