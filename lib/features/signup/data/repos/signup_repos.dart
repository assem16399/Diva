import 'package:diva/core/networking/api_error_handler.dart';
import 'package:diva/core/networking/api_result.dart';
import 'package:diva/features/signup/data/apis/signup_api_service.dart';
import 'package:diva/features/signup/data/models/signup_request_body.dart';
import 'package:diva/features/signup/data/models/signup_response.dart';

class SignupRepo {
  SignupRepo(this._apiService);

  final SignupApiService _apiService;

  Future<ApiResult<SignupResponse>> signup(
    SignupRequestBody signupRequestBody,
  ) async {
    try {
      final response = await _apiService.signup(signupRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
