import 'package:diva/core/networking/dio_factory.dart';
import 'package:diva/features/cart/data/apis/cart_api_service.dart';
import 'package:diva/features/cart/data/repos/cart_repo.dart';
import 'package:diva/features/cart/logic/cart_cubit.dart';
import 'package:diva/features/categeries_secreen/data/apis/catecroies_api_service.dart';
import 'package:diva/features/categeries_secreen/data/repo/categries_repo.dart';
import 'package:diva/features/categeries_secreen/logic/categories_cubit.dart';
import 'package:diva/features/home_Screen/data/apis/home_api_service.dart';
import 'package:diva/features/home_Screen/data/repo/home_repo.dart';
import 'package:diva/features/home_Screen/logic/home_screen_cubit.dart';
import 'package:diva/features/login/data/apis/login_api_service.dart';
import 'package:diva/features/login/data/repo/login_repo.dart';
import 'package:diva/features/login/logic/login_cubit.dart';
import 'package:diva/features/product_details/data/apis/product_details_api_service.dart';
import 'package:diva/features/product_details/data/repos/product_details_repo.dart';
import 'package:diva/features/product_details/logic/product_details_cubit.dart';
import 'package:diva/features/signup/data/apis/signup_api_service.dart';
import 'package:diva/features/signup/data/repos/signup_repos.dart';
import 'package:diva/features/signup/logic/signup_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Dio
  final dio = DioFactory.getDio();
  getIt
    ..registerLazySingleton<LoginApiService>(() => LoginApiService(dio))
    // login
    ..registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()))
    ..registerFactory<LoginCubit>(() => LoginCubit(getIt()))

    // Signup
    ..registerLazySingleton<SignupApiService>(() => SignupApiService(dio))
    ..registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()))
    ..registerFactory<SignupCubit>(() => SignupCubit(getIt()))
    // ProductDetails

    ..registerLazySingleton<ProductDetailsApiService>(
      () => ProductDetailsApiService(dio),
    )
    ..registerLazySingleton<ProductDetailsRepo>(
      () => ProductDetailsRepo(getIt()),
    )
    ..registerFactory<ProductDetailsCubit>(() => ProductDetailsCubit(getIt()))

    // Categories
    ..registerLazySingleton<CategriesApiService>(() => CategriesApiService(dio))
    ..registerLazySingleton<CategoryRepository>(
        () => CategoryRepository(getIt()))
    ..registerFactory<CategoriesCubit>(() => CategoriesCubit(getIt()))

    // Cart
    ..registerLazySingleton<CartApiService>(() => CartApiService(dio))
    ..registerLazySingleton<CartRepo>(() => CartRepo(getIt()))
    ..registerFactory<CartCubit>(() => CartCubit(getIt()))

    //HomeScreen
    ..registerLazySingleton<HomeApiService>(() => HomeApiService(dio))
    ..registerLazySingleton<HomeRepository>(() => HomeRepository(getIt()))
    ..registerFactory<HomeScreenCubit>(() => HomeScreenCubit(getIt()));
}
