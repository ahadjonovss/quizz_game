import 'dart:ui';

import 'package:flutter/cupertino.dart';

Widget timer(int time){
  return Container(
    child: Text(
      time.toString().length == 1
          ? "0" + time.toString()
          : time.toString(),
      style: TextStyle(fontSize: 16),
      textAlign: TextAlign.center,
    ),
  );
}
