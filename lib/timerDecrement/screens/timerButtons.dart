import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:test_hooks/timerDecrement/functions/isAnimatingPlay.dart';
import 'package:test_hooks/timerDecrement/functions/isAnimatingReset.dart';

part 'timerButtons.g.dart';

@FunctionalWidget(widgetType: FunctionalWidgetType.hook)
Widget timerButtons({AnimationController timerController}) {
  final animated = useState(false);
  timerController.addStatusListener((status) {
    if (status == AnimationStatus.completed ||
        status == AnimationStatus.dismissed) {
      timerController.reset();
      animated.value = false;
    }
  });

  return ButtonBar(
    alignment: MainAxisAlignment.center,
    children: [
      MaterialButton(
        color: Colors.deepOrangeAccent,
        onPressed: isAnimatingPlay(mtd: timerController, animate: animated),
        child: Icon(
          animated.value ? Icons.stop : Icons.play_arrow,
        ),
      ),
      MaterialButton(
        onPressed: isAnimatingReset(mtd: timerController, animate: animated),
        color: Colors.purpleAccent,
        child: Icon(
          Icons.redo,
        ),
      ),
    ],
  );
}
