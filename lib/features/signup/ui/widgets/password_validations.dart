import 'package:diva/core/helpers/app_regex.dart';
import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/themes/colors.dart';
import 'package:diva/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidations extends StatefulWidget {
  const PasswordValidations({
    required this.controller,
    required this.getPasswordValidationStatus,
    super.key,
  });
  final TextEditingController controller;
  final void Function({required bool isValid}) getPasswordValidationStatus;

  @override
  State<PasswordValidations> createState() => _PasswordValidationsState();
}

class _PasswordValidationsState extends State<PasswordValidations> {
  var _hasLowerCase = false;
  var _hasUpperCase = false;
  var _hasSpecialCharacters = false;
  var _hasMinLength = false;

  @override
  void initState() {
    super.initState();

    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    widget.controller.addListener(listener);
  }

  void listener() {
    setState(() {
      _hasLowerCase = AppRegex.hasLowerCase(widget.controller.text);
      _hasUpperCase = AppRegex.hasUpperCase(widget.controller.text);
      _hasSpecialCharacters =
          AppRegex.hasSpecialCharacter(widget.controller.text);
      _hasMinLength = AppRegex.hasMinLength(widget.controller.text);
    });

    widget.getPasswordValidationStatus(
      isValid: _hasLowerCase &&
          _hasUpperCase &&
          _hasSpecialCharacters &&
          _hasMinLength,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 4.h, left: 8.w),
        child: Column(
          children: [
            buildValidationRow(
              '8 Characters Minimum',
              hasValidated: _hasMinLength,
            ),
            verticalSpace(1),
            buildValidationRow(
              'One Upper Character',
              hasValidated: _hasUpperCase,
            ),
            verticalSpace(1),
            buildValidationRow(
              'One Lower Character',
              hasValidated: _hasLowerCase,
            ),
            verticalSpace(1),
            buildValidationRow(
              'One Special Character',
              hasValidated: _hasSpecialCharacters,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildValidationRow(String text, {required bool hasValidated}) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5,
          backgroundColor:
              hasValidated ? ColorsManager.forestGreen : ColorsManager.vividRed,
        ),
        horizontalSpace(6),
        Text(
          text,
          style: TextStyles.fontMulish12W400.copyWith(
            color: hasValidated
                ? ColorsManager.forestGreen
                : ColorsManager.vividRed,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    widget.controller.removeListener(listener);
    super.dispose();
  }
}
