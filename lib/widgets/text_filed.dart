import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/fonts.dart';

Widget textfield(String hintText) {
  return Container(
    padding: EdgeInsets.only(left: 12),
    decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
    height: 50,
    width: 300,
    child: Center(
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: MyFonts.F_18.copyWith(color: Colors.grey),
        ),
      ),
    ),
  );
}
