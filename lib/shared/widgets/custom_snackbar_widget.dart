import 'package:flutter/material.dart';

customSnackBar(context, {required text}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.black87,
    duration: const Duration(seconds: 2),
    shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30))),
    elevation: 5,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
    padding: const EdgeInsets.only(left: 20),
    action: SnackBarAction(
      label: 'OK',
      onPressed: () {},
    ),
    content: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
  ));
}
