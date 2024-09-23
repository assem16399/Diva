import 'package:diva/core/di/dependency_injection.dart';
import 'package:diva/core/routing/app_router.dart';
import 'package:diva/diva_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();

  runApp(const DivaApp(appRouter: AppRouter()));
}
