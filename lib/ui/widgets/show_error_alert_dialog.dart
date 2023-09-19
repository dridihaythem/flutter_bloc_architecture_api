import 'package:flutter/material.dart';

void showErrorAlertDialog(
  BuildContext context, {
  required String title,
  required String content,
  required VoidCallback onTap,
}) =>
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
              onPressed: () {
                onTap();
                Navigator.of(context).pop();
              },
              child: const Text('Try Again'))
        ],
      ),
    );
