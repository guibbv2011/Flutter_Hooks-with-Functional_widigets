import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'timerBuilder.g.dart';

@hwidget
Widget timerBuilder({
  AnimationController timerController,
}) {
  final divH = MediaQuery.of(useContext()).size.height;
  final divW = MediaQuery.of(useContext()).size.width;
  return Container(
    padding: EdgeInsets.all(10.0),
    height: divH * 0.5,
    width: divW * 0.75,
    child: CircularProgressIndicator(
      backgroundColor: Colors.white,
      value: useAnimation(timerController),
      strokeWidth: 4.0,
    ),
  );
}
