// app_route.dart
import 'package:flutter/material.dart';
import 'package:todo_app/features/home/presentation/view/home_view.dart';

class AppRoute {
  static const String homeRoute = '/home';

  static Map<String, WidgetBuilder> getApplicationRoute() {
    return {
      homeRoute: (context) => HomeView(),
    };
  }
}
