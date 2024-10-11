import 'package:diva/core/networking/api_error_model.dart';

// simple factory to create an instance of ApiErrorModel based on the error
// response whether it's a FirebaseAuthErrorModel or a generic ApiErrorModel
abstract class ApiErrorModelFactory {
  static ApiErrorModel createApiErrorModel(dynamic json) {
    if (json is! Map<String, dynamic>) {
      return ApiErrorModel(
        message: 'Something went wrong! Please try again later.',
      );
    }
    if (json['error'] != null) {
      return FirebaseAuthErrorModel.fromJson(
        json['error'] as Map<String, dynamic>,
      );
    } else {
      return _handleError(json);
    }
  }

  static ApiErrorModel _handleError(dynamic data) {
    return ApiErrorModel(
      message: data['message'] as String? ?? 'Unknown error occurred',
      code: data['code'] as int?,
      errors: data['data'],
    );
  }
}
