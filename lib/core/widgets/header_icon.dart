import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderIcon extends StatelessWidget {
  const HeaderIcon({
    required this.iconPath,
    super.key,
    this.onPressed,
  });

  final String iconPath;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 32.w,
        width: 32.w,
        child: Card(
          elevation: 0.2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          color: Colors.white,
          margin: EdgeInsets.zero,
          child: Center(
            child: SizedBox(
              child: SvgPicture.asset(iconPath),
            ),
          ),
        ),
      ),
    );
  }
}
