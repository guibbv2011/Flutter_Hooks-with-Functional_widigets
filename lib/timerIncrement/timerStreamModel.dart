import 'dart:async';

import 'package:rxdart/subjects.dart';

class TimerStreamModel {
  final Stopwatch _stopWatch;
  final BehaviorSubject<double> seconds;
  final BehaviorSubject<double> minutes;
  final BehaviorSubject<double> hours;
  final BehaviorSubject<Duration> duration;
  final int speedMultiplier;
  Timer _timer;

  TimerStreamModel({this.speedMultiplier = 1})
      : _stopWatch = Stopwatch(),
        seconds = BehaviorSubject.seeded(0.0),
        minutes = BehaviorSubject.seeded(0.0),
        hours = BehaviorSubject.seeded(0.0),
        duration = BehaviorSubject.seeded(Duration.zero);

  _timerElapsed(Timer timer) {
    final elapsedTime = _stopWatch.elapsed * speedMultiplier;
    if (elapsedTime.inSeconds != duration.value.inSeconds)
      seconds.add((elapsedTime.inSeconds % 60) / 60.0);
    if (elapsedTime.inMinutes != duration.value.inMinutes)
      minutes.add((elapsedTime.inMinutes % 60) / 60.0);
    if (elapsedTime.inHours != duration.value.inHours)
      hours.add(elapsedTime.inHours / 24.0);
    duration.add(elapsedTime);
  }

  disposeTimerModel() {
    seconds.close();
    minutes.close();
    hours.close();
    duration.close();
  }

  start() {
    stop();
    _stopWatch.start();
    _timer = Timer.periodic(
        Duration(milliseconds: 1000 ~/ speedMultiplier), _timerElapsed);
  }

  stop() {
    _stopWatch.stop();
    if (_timer != null) _timer.cancel();
  }

  reset() {
    _stopWatch.reset();
    if (_timer != null) _timer.cancel();
    duration.add(Duration.zero);
    seconds.add(0.0);
    minutes.add(0.0);
    hours.add(0.0);
  }
}
