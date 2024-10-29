import 'package:diva/core/di/dependency_injection.dart';
import 'package:diva/core/routing/app_router.dart';
import 'package:diva/diva_app.dart';
import 'package:diva/features/categeries_secreen/data/models/category_product_response_model.dart';
import 'package:diva/features/wishlist_screen/ui/weights/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive
    ..registerAdapter(CategoryProductResponseModelAdapter())
    ..registerAdapter(RatingAdapter());
  await ProductWishListRepository.openBox();
  setupGetIt();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();

  runApp(const DivaApp(appRouter: AppRouter()));
}
