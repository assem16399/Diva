import 'package:diva/core/helpers/extensions.dart';
import 'package:diva/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    required this.errorMsg,
    super.key,
  });
  final String errorMsg;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        errorMsg,
        style: TextStyles.font14BlackW400,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            'Got it',
            style: TextStyles.font14MainDeepPinkW400,
          ),
        ),
      ],
    );
  }
}
