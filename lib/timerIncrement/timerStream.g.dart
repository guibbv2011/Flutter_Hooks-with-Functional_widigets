// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timerStream.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class TimerStream extends HookWidget {
  const TimerStream({Key key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => timerStream();
}

class ProgressIndicatorSubject extends HookWidget {
  const ProgressIndicatorSubject(
      this.subject, this.diameter, this.strokeWidth, this.color,
      {Key key})
      : super(key: key);

  final BehaviorSubject<double> subject;

  final double diameter;

  final double strokeWidth;

  final Color color;

  @override
  Widget build(BuildContext _context) =>
      progressIndicatorSubject(subject, diameter, strokeWidth, color);
}

class TimerText2 extends HookWidget {
  const TimerText2(this.subject, {Key key}) : super(key: key);

  final BehaviorSubject<Duration> subject;

  @override
  Widget build(BuildContext _context) => timerText2(subject);
}
