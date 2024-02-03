import 'package:flutter/material.dart';

class ShowProgressDialogWithMessage extends StatelessWidget {
  final String message;
  const ShowProgressDialogWithMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 16),
        Text(message),
      ],
    ));
  }
}
