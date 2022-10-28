import 'package:flutter/material.dart';
import 'package:test_transisi/ui/pages/auth/login_page.dart';
import 'package:test_transisi/ui/pages/detail_user/detail_user.dart';
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
    case DetailUserPage.routeName:
      final id = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => DetailUserPage(userId: id),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const ErrorPage(),
      );
  }
};
