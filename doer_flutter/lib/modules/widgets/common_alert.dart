import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommonAlertDialog extends StatelessWidget {
  final String title;
  final String content;

  final VoidCallback onButttonPressed;
  const CommonAlertDialog({
    super.key,
    this.title = '',
    this.content = '',
    required this.onButttonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      content: Text(
        content,
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text(
              'Cancel',
            )),
        TextButton(
            onPressed: onButttonPressed,
            child: const Text(
              'Log out',
            ))
      ],
    );
  }
}
