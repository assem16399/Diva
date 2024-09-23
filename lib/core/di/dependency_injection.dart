import 'package:diva/core/networking/dio_factory.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Dio & ApiService
  final _ = DioFactory.getDio();
}
