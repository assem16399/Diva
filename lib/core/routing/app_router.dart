import 'package:diva/core/routing/routes.dart';
import 'package:flutter/material.dart';

import '../../features/login/ui/Login_Screen.dart';

class AppRouter {
  const AppRouter();

  Route<dynamic> generateRoute(RouteSettings settings) {
    //Arguments to be passed in any screen like this ( arguments as ClassName)
    final _ = settings.arguments;

    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
