// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timerDecrement.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class TimerColumn extends HookWidget {
  const TimerColumn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => timerColumn();
}

class Timer extends StatelessWidget {
  const Timer({Key key, this.timerController}) : super(key: key);

  final AnimationController timerController;

  @override
  Widget build(BuildContext _context) =>
      timer(timerController: timerController);
}
