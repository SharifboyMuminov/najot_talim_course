import 'package:flutter/material.dart';

void muySnackBar(BuildContext context, {String text = "Save ^_^"}) async {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      content: Text(text),
    ),
  );
}
