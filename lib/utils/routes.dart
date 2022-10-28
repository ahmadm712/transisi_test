import 'package:flutter/material.dart';
import 'package:test_transisi/ui/pages/auth/login_page.dart';
import 'package:test_transisi/ui/pages/pages.dart';

var mainRoutes = (RouteSettings settings) {
  switch (settings.name) {
    case HomePage.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomePage(),
      );
    case LoginPage.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const ErrorPage(),
      );
  }
};
