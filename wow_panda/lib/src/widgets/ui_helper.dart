import 'package:flutter/material.dart';

class UIHelper {
  Future showErrorDialog(BuildContext context, err) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error", style: TextStyle(color: Colors.red)),
          content: Text(
            err.toString(),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
