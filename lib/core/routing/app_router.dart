import 'package:diva/core/di/dependency_injection.dart';
import 'package:diva/core/routing/routes.dart';
import 'package:diva/core/widgets/my_bottom_nav_bar.dart';
import 'package:diva/features/cart/ui/cart_tab.dart';
import 'package:diva/features/login/logic/login_cubit.dart';
import 'package:diva/features/login/ui/login_screen.dart';
import 'package:diva/features/product_details/logic/product_details_cubit.dart';
import 'package:diva/features/product_details/ui/product_details_screen.dart';
import 'package:diva/features/signup/logic/signup_cubit.dart';
import 'package:diva/features/signup/ui/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  const AppRouter();

  Route<dynamic> generateRoute(RouteSettings settings) {
    //Arguments to be passed in any screen like this ( arguments as ClassName)
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SignupCubit>(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );
      case Routes.productDetails:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<ProductDetailsCubit>(
            create: (context) => getIt<ProductDetailsCubit>()
              ..getProductDetails((arguments as int?) ?? 4),
            child: const ProductDetailsScreen(),
          ),
        );
      case Routes.cartScreen:
        return MaterialPageRoute(
          builder: (_) => const CartTab(hasScaffold: true),
        );
      case Routes.myBottomNavBar:
        return MaterialPageRoute(
          builder: (_) => const MyBottomNavBar(),
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
