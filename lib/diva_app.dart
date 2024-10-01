import 'package:diva/core/routing/app_router.dart';
import 'package:diva/core/routing/routes.dart';
import 'package:diva/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DivaApp extends StatelessWidget {
  const DivaApp({required this.appRouter, super.key});

  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        title: 'Diva',
        theme: ThemeData(
          primaryColor: ColorsManager.mainDeepPink,
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.productDetails,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
