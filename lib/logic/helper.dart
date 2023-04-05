import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void navigatorTo(context, Widget widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => false,
  );
}
