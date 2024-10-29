import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    required this.title,
    required this.content,
    this.onActionPressed,
    super.key,
  });

  final String title;
  final String content;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(content),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            disabledForegroundColor: Colors.grey.withOpacity(0.38),
          ),
          onPressed: onActionPressed,
          child: const Text('Continue'),
        ),
      ],
    );
  }
}
