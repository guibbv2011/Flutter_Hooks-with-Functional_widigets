import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:test_hooks/counter_reactive/rxCounter.dart';

part 'counter.g.dart';

@hwidget
Widget counter() {
  final modelCounter = Count();
  useEffect(() => Count().dispode());
  return Container(
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CounterText(modelCounter.output, 'Dart Async'),
        CounterText(modelCounter.stream$, 'RxDART'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HooksCounter(() => modelCounter.decrement(),
                icon: Icon(Icons.remove_circle)),
            HooksCounter(() => modelCounter.increment(), icon: Icon(Icons.add)),
          ],
        ),
      ],
    ),
  );
}

@hwidget
Widget counterText(str, rxorasync) {
  return HookBuilder(
    builder: (context) {
      final stream = str;
      final snapshot = useStream(stream);
      return Text(
        "you click ${snapshot.data ?? 0} times with $rxorasync",
        style: Theme.of(useContext()).textTheme.headline3,
      );
    },
  );
}

@hwidget
Widget hooksCounter(add, {icon: Function}) {
  return Column(
    children: [
      Text('Click me', style: Theme.of(useContext()).textTheme.subtitle2),
      Container(
        height: 8.0,
      ),
      FloatingActionButton(
        onPressed: add,
        backgroundColor: Colors.red,
        elevation: 2,
        child: icon,
      ),
    ],
  );
}
