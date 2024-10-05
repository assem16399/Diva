import 'package:diva/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class AuthScreenTitle extends StatelessWidget {
  const AuthScreenTitle({
    required this.title,
    super.key,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyles.fontLibreBaskerville24BlackW400,
    );
  }
}
