import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:test_hooks/timerDecrement/widgets/textControl.dart';

part 'timerText.g.dart';

@FunctionalWidget(widgetType: FunctionalWidgetType.stateless)
Widget timerText({
  AnimationController timerController,
}) {
  return Align(
    alignment: FractionalOffset.center,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Count Down", style: TextStyle(fontSize: 30.0)),
        AnimatedBuilder(
          animation: timerController,
          builder: (context, child) {
            Duration duration =
                timerController.duration * (1.0 - timerController.value);
            return textControl(mtd: timerController, time: duration);
          },
        )
      ],
    ),
  );
}
