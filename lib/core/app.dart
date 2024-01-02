import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/config/router/app_route.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      initialRoute: AppRoute.homeRoute,
      routes: AppRoute.getApplicationRoute(),
    );
  }
}