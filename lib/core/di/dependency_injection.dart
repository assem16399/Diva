import 'package:diva/core/networking/dio_factory.dart';
import 'package:diva/features/categeries_secreen/data/apis/catecroies_api_service.dart';
import 'package:diva/features/categeries_secreen/data/repo/categries_repo.dart';
import 'package:diva/features/categeries_secreen/logic/categories_cubit.dart';
import 'package:diva/features/home_Screen/data/apis/home_api_service.dart';
import 'package:diva/features/home_Screen/data/repo/home_repo.dart';
import 'package:diva/features/home_Screen/logic/home_screen_cubit.dart';
import 'package:diva/features/signup/data/apis/signup_api_service.dart';
import 'package:diva/features/signup/data/repos/signup_repos.dart';
import 'package:diva/features/signup/logic/signup_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Dio
  final dio = DioFactory.getDio();

  // Signup
  getIt
    ..registerLazySingleton<SignupApiService>(() => SignupApiService(dio))
    ..registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()))
    ..registerFactory<SignupCubit>(() => SignupCubit(getIt()))
    // categories

    ..registerLazySingleton<CategriesApiService>(() => CategriesApiService(dio))
    ..registerLazySingleton<CategoryRepository>(
        () => CategoryRepository(getIt()))
    ..registerFactory<CategoriesCubit>(() => CategoriesCubit(getIt()))
    //HomeScreen

    ..registerLazySingleton<HomeApiService>(() => HomeApiService(dio))
    ..registerLazySingleton<HomeRepository>(() => HomeRepository(getIt()))
    ..registerFactory<HomeScreenCubit>(() => HomeScreenCubit(getIt()));
}
