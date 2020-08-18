import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:test_hooks/functions/service_locator.dart';
import 'package:test_hooks/functions/nav_manager.dart';
import 'dart:async';

part 'main.g.dart';

void main() {
  initServiceLocator();
  runApp(MyApp());
}

@hwidget
Widget myApp() {
  final navManager = getIt<NavManager>();

  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Test Hooks',
    theme: ThemeData(
      canvasColor: Colors.blueGrey,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      accentColor: Colors.pinkAccent,
      brightness: Brightness.dark,
    ),
    home: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(1000.0, 1000.0),
        child: Container(
          color: Colors.blue,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: InkWell(
              child: Text('Test Hooks'),
            ),
          ),
        ),
      ),
      body: Navigator(
        key: navManager.navigatorKey,
        onGenerateRoute: navManager.onGenerateRoute,
      ),
      bottomNavigationBar: BottomNav(navManager),
    ),
  );
}

@hwidget
Widget bottomNav(NavManager navManager) => BottomNavigationBar(
      currentIndex: useStream(navManager.currentIndex).data ?? 0,
      onTap: navManager.navigateToIndex,
      items: navManager.items
          .map(
            (item) => BottomNavigationBarItem(
              icon: Icon(item.icon),
              title: Text(item.title),
            ),
          )
          .toList(),
    );
