import 'package:diva/core/routing/routes.dart';
import 'package:diva/features/login/ui/login_screen.dart';
import 'package:diva/features/signup/ui/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../features/home_Screen/ui/home_Screen_Ui.dart';
import '../../features/home_Screen/ui/weights/my_Bottom_NavBar.dart';

class AppRouter {
  const AppRouter();

  Route<dynamic> generateRoute(RouteSettings settings) {
    //Arguments to be passed in any screen like this ( arguments as ClassName)
    final _ = settings.arguments;

    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreenUi());
      case Routes.myBottomNavBar:
        return MaterialPageRoute(
          builder: (_) => MyBottomNavBar(),
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
