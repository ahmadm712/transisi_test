import 'package:flutter/material.dart';
import 'package:test_transisi/ui/pages/pages.dart';

var mainRoutes = (RouteSettings settings) {
  switch (settings.name) {
    case HomePage.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomePage(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const ErrorPage(),
      );
  }
};
