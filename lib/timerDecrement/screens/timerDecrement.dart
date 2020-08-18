import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:test_hooks/timerDecrement/screens/timerBuilder.dart';
import 'package:test_hooks/timerDecrement/screens/timerButtons.dart';
import 'package:test_hooks/timerDecrement/screens/timerText.dart';
import 'package:test_hooks/timerDecrement/widgets/sliderControl.dart';
import 'dart:async';

part 'timerDecrement.g.dart';

@hwidget
Widget timerColumn() {
  final shortestSide = MediaQuery.of(useContext()).size.shortestSide;
  final seconds = useState(0.0);
  final minutes = useState(0.0);

  final timerController = useAnimationController(
      duration: Duration(
    minutes: minutes.value.toInt(),
    seconds: seconds.value.toInt(),
  ));

  return Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: shortestSide * 0.40,
            height: shortestSide * 0.40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(shortestSide * 0.35),
              color: Color(0xFF363E66),
            ),
          ),
          TimerText(
            timerController: timerController,
          ),
        ],
      ),
      Text('Minutes'),
      sliderControl(mtd: timerController, timer: minutes, div: 10, max: 10.0),
      Text('Seconds'),
      sliderControl(mtd: timerController, timer: seconds, div: 59, max: 59.0),
    ],
  );
}

@FunctionalWidget(widgetType: FunctionalWidgetType.stateless)
Widget timer({
  AnimationController timerController,
}) {
  return Column(
    children: [
      Stack(
        alignment: Alignment.center,
        children: [
          TimerBuilder(timerController: timerController),
          TimerText(timerController: timerController),
        ],
      ),
      TimerButtons(timerController: timerController),
    ],
  );
}
