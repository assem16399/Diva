import 'package:dio/dio.dart';
import 'package:diva/features/login/data/apis/login_api_constants.dart';
import 'package:diva/features/login/data/models/login_request_body.dart';
import 'package:diva/features/login/data/models/login_response.dart';
import 'package:retrofit/retrofit.dart';

part 'login_api_service.g.dart';

@RestApi(baseUrl: LoginApiConstants.loginBaseUrl)
abstract class LoginApiService {
  factory LoginApiService(Dio dio, {String baseUrl}) = _LoginApiService;
  @POST(LoginApiConstants.loginEP)
  Future<LoginResponse> login(
    @Body() LoginRequestBody body, {
    @Query('key') String apiKey = 'AIzaSyChRe4Npm-ICZaZFGmeYGWoLWNAoPqfruU',
  });
}
