import 'package:diva/core/networking/api_error_handler.dart';
import 'package:diva/core/networking/api_result.dart';
import 'package:diva/features/login/data/apis/login_api_service.dart';
import 'package:diva/features/login/data/models/login_request_body.dart';
import 'package:diva/features/login/data/models/login_response.dart';

class LoginRepo {
  LoginRepo(this._apiService);

  final LoginApiService _apiService;

  Future<ApiResult<LoginResponse>> login(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
