import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget buildBar(BuildContext context,String title) {
  return AppBar(
    title: Text(title),
  );
}