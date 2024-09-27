import 'package:dio/dio.dart';
import 'package:diva/features/signup/data/apis/signup_api_constants.dart';
import 'package:diva/features/signup/data/models/signup_request_body.dart';
import 'package:diva/features/signup/data/models/signup_response.dart';
import 'package:retrofit/retrofit.dart';

part 'signup_api_service.g.dart';

@RestApi(baseUrl: SignupApiConstants.signupBaseUrl)
abstract class SignupApiService {
  factory SignupApiService(Dio dio, {String baseUrl}) = _SignupApiService;

  @POST(SignupApiConstants.signupEp)
  Future<SignupResponse> signup(
    @Body() SignupRequestBody body, {
    @Query('key') String apiKey = 'AIzaSyChRe4Npm-ICZaZFGmeYGWoLWNAoPqfruU',
  });
}
