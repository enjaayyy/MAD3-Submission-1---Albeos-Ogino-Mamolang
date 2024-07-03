import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:midterm_project/screens/homescreen.dart';
import 'package:midterm_project/screens/login.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/homescreen',
      builder: (BuildContext context, GoRouterState state) {
        return const Homescreen();
      },
    ),
  ],
);
