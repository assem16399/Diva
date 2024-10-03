import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvailableSizes extends StatefulWidget {
  const AvailableSizes({super.key});

  @override
  State<AvailableSizes> createState() => _AvailableSizesState();
}

class _AvailableSizesState extends State<AvailableSizes> {
  var _selectedSizeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => horizontalSpace(8),
        itemBuilder: (context, index) => Stack(
          clipBehavior: Clip.none,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedSizeIndex = index;
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: _selectedSizeIndex != index
                      ? null
                      : ColorsManager.mainDeepPink,
                  child: Text(
                    'L',
                    style: TextStyle(
                      color: _selectedSizeIndex != index
                          ? ColorsManager.mainDeepPink
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
