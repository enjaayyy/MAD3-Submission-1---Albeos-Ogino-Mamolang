import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:midterm_project/router/router.dart';
import 'package:midterm_project/screens/authnotifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthNotifier()..checkLoginStatus(),
      child: Consumer<AuthNotifier>(
        builder: (context, authNotifier, _) {
          return MaterialApp.router(
            routerConfig: router,
          );
        },
      ),
    );
  }
}
