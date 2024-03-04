import 'package:flutter/material.dart';

class SnackBarUtils {
  success(String title, IconData iconData, BuildContext context) {
    final snackBar = SnackBar(
      backgroundColor: Colors.green,
      content: Row(
        children: [
          Icon(
            iconData,
            color: Colors.white,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(title),
        ],
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  error(String title, IconData iconData, BuildContext context) {
    final snackBar = SnackBar(
      backgroundColor: Colors.red,
      content: Row(
        children: [
          Icon(
            iconData,
            color: Colors.white,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(title),
        ],
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
