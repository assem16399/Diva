import 'package:diva/core/networking/dio_factory.dart';
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
    ..registerFactory<SignupCubit>(() => SignupCubit(getIt()));
}
