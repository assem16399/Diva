import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

import '../../../../core/themes/styles.dart';

class dontHaveAccount extends StatelessWidget {
  const dontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account?',
            style: TextStyles.font14GreyRegular,
          ),
          TextSpan(
            text: ' Sign Up',
            style: TextStyles.font14PinkRegular,
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
      ),
    );
  }
}
