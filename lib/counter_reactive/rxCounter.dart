import 'dart:async';

import 'package:rxdart/rxdart.dart';

class Count {
  // Bloc pattern with rxdart ---------------

  final _counter = BehaviorSubject.seeded(0);

  get stream$ => _counter.stream;
  int get current => _counter.value;

  increment() => _counter.add(current + 1);

  // ----------------------------------------

  // Bloc with dart streams -----------------

  int menos = 0;
  final _counterBloc = StreamController();

  Sink get input => _counterBloc.sink;
  Stream get output => _counterBloc.stream;

  decrement() {
    menos--;
    input.add(menos);
  }

  // ---------------------------------------

  // Dispose all ---------------------------

  dispose() {
    _counter.close();
    _counterBloc.close();
  }

  // ---------------------------------------
}
