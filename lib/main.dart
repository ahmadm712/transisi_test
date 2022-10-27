import 'package:flutter/material.dart';
import 'package:test_transisi/ui/pages/pages.dart';
import 'package:test_transisi/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transisi Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: mainRoutes,
      home: const HomePage(),
    );
  }
}
