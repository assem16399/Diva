import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/themes/colors.dart';
import 'package:diva/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvailableColors extends StatefulWidget {
  const AvailableColors({super.key});

  @override
  State<AvailableColors> createState() => _AvailableColorsState();
}

class _AvailableColorsState extends State<AvailableColors> {
  var _selectedColorIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        itemCount: 9,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => horizontalSpace(8),
        itemBuilder: (context, index) => Stack(
          clipBehavior: Clip.none,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColorIndex = index;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: _selectedColorIndex != index
                      ? null
                      : Border.all(width: 1.5.w),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                child: const CircleAvatar(radius: 16),
              ),
            ),
            if (index.isEven) const BestColorFlag(),
          ],
        ),
      ),
    );
  }
}

class BestColorFlag extends StatelessWidget {
  const BestColorFlag({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -8,
      top: 1,
      child: Container(
        width: 32,
        height: 16,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          color: ColorsManager.lightPinkishColor,
        ),
        alignment: Alignment.center,
        child: Text(
          'Best',
          style: TextStyles.font10VibrantPinkishRedColorW400,
        ),
      ),
    );
  }
}
