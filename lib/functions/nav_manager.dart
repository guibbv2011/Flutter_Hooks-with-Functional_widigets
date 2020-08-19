import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:test_hooks/draggable/draggable.dart';
import 'package:test_hooks/timerDecrement/screens/timerDecrement.dart';
import 'package:test_hooks/timerIncrement/timerStream.dart';
import 'package:test_hooks/timerIncrement/timerStreamModel.dart';
import 'package:test_hooks/counter_reactive/counter.dart';
import 'package:test_hooks/counter_reactive/rxCounter.dart';

class NavItem {
  final IconData icon;
  final String title;
  final String route;
  final WidgetBuilder builder;

  NavItem(
      {@required this.icon,
      @required this.title,
      @required this.route,
      @required this.builder});
}

class NavManager {
  // Instace for disposing streams
  final modelCounter = Count();
  final modelIncrement = TimerStreamModel();

  // Instance from NavManager
  final GlobalKey<NavigatorState> navigatorKey;
  final BehaviorSubject<int> currentIndex;
  final List<NavItem> items;
  final String defaultRoute;

  // Constructor NavManager who are builder de items for routes
  NavManager()
      : navigatorKey = GlobalKey<NavigatorState>(),
        currentIndex = BehaviorSubject(),
        items = [
          NavItem(
              icon: Icons.plus_one,
              title: 'Counter',
              route: '/',
              builder: (_) => Counter()),
          NavItem(
              icon: Icons.add_circle,
              title: 'Timer Increment',
              route: '/Increment',
              builder: (_) => TimerStream()),
          NavItem(
              icon: Icons.remove_circle,
              title: 'Timer Decrement',
              route: '/Decrement',
              builder: (_) => TimerColumn()),
          NavItem(
              icon: Icons.compare_arrows,
              title: 'Draggable',
              route: '/Draggable',
              builder: (_) => DragablleApp()),
        ],
        defaultRoute = '/';

  // Called material page router who select item of NavManager
  Route<dynamic> onGenerateRoute(RouteSettings settings) => MaterialPageRoute(
      builder:
          items.singleWhere((item) => item.route == settings.name).builder);

  // if current index be has value and value of currentIndex is equals index
  // => this navigate for page who represents this index;
  navigateToIndex(int index) {
    if (currentIndex.hasValue && index == currentIndex.value) return;
    // disposing streams when changes screen
    switch (currentIndex.value) {
      case 0:
        modelCounter.dispose();
        print('called modelCounter dispose() has successful');
        break;
      case 1:
        modelIncrement.disposeTimerModel();
        print('called modelIncrement dispose() has successful');
        break;
    }
    navigatorKey.currentState.pushReplacementNamed(items[index].route);
    currentIndex.add(index);
  }
}
