import 'package:dio/dio.dart';
import 'package:diva/core/networking/api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: 'Connection to server failed');
        case DioExceptionType.cancel:
          return ApiErrorModel(message: 'Request to the server was cancelled');
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: 'Connection timeout with the server');
        case DioExceptionType.unknown:
          return ApiErrorModel(
            message:
                'Connection to the server failed due to internet connection',
          );
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
            message: 'Receive timeout in connection with the server',
          );
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
            message: 'Send timeout in connection with the server',
          );

        case DioExceptionType.badCertificate:
          return ApiErrorModel(message: 'Bad certificate');
      }
    } else {
      return ApiErrorModel(message: 'Unknown error occurred');
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  return ApiErrorModel(
    message: data['message'] as String? ?? 'Unknown error occurred',
    code: data['code'] as int?,
    errors: data['data'],
  );
}
