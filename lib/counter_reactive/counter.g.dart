// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class Counter extends HookWidget {
  const Counter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => counter();
}

class CounterText extends HookWidget {
  const CounterText(this.str, this.rxorasync, {Key key}) : super(key: key);

  final dynamic str;

  final dynamic rxorasync;

  @override
  Widget build(BuildContext _context) => counterText(str, rxorasync);
}

class HooksCounter extends HookWidget {
  const HooksCounter(this.add, {Key key, this.icon = Function})
      : super(key: key);

  final dynamic add;

  final dynamic icon;

  @override
  Widget build(BuildContext _context) => hooksCounter(add, icon: icon);
}
