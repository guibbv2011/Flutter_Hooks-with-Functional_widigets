import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test_hooks/timerIncrement/timerStreamModel.dart';

part 'timerStream.g.dart';

@FunctionalWidget(widgetType: FunctionalWidgetType.hook)
Widget timerStream() {
  final modelIncrement =
      useMemoized(() => TimerStreamModel(speedMultiplier: 50));
  final shortestSide = MediaQuery.of(useContext()).size.shortestSide;
  return Container(
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: shortestSide * 0.55,
              height: shortestSide * 0.55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(shortestSide * 0.5),
                color: Color(0xFF363E66),
              ),
            ),
            ProgressIndicatorSubject(modelIncrement.seconds, shortestSide * 0.6,
                shortestSide * 0.05, Color(0xFF859DC1)),
            ProgressIndicatorSubject(modelIncrement.minutes, shortestSide * 0.7,
                shortestSide * 0.05, Color(0xFF82BDBF)),
            ProgressIndicatorSubject(modelIncrement.hours, shortestSide * 0.8,
                shortestSide * 0.05, Color(0xFFB8D6E1)),
            TimerText2(modelIncrement.duration),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
                child: Text('Start'),
                color: Colors.green,
                onPressed: () => modelIncrement.start()),
            RaisedButton(
                child: Text('Stop'),
                color: Colors.redAccent,
                onPressed: () => modelIncrement.stop()),
            RaisedButton(
                child: Text('Reset'),
                color: Colors.blueAccent,
                onPressed: () => modelIncrement.reset()),
          ],
        )
      ],
    ),
  );
}

@FunctionalWidget(widgetType: FunctionalWidgetType.hook)
Widget progressIndicatorSubject(BehaviorSubject<double> subject,
    double diameter, double strokeWidth, Color color) {
  return Container(
    height: diameter,
    width: diameter,
    child: CircularProgressIndicator(
      value: useStream(subject).data ?? 0.0,
      strokeWidth: strokeWidth,
      valueColor: AlwaysStoppedAnimation(color),
    ),
  );
}

@FunctionalWidget(widgetType: FunctionalWidgetType.hook)
Widget timerText2(BehaviorSubject<Duration> subject) {
  final duration = useStream(subject).data ?? Duration.zero;
  final hours = duration.inHours.toString().padLeft(2, '0');
  final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
  final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');

  return Text('$hours:$minutes:$seconds',
      style: Theme.of(useContext()).textTheme.headline2);
}
