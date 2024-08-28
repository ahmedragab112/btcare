import 'package:btcare/core/error/api_error_model.dart';
import 'package:btcare/core/error/api_errors.dart';
import 'package:dio/dio.dart';

enum DataSource {
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  // apiLogicError,
  defaultError
}

class ResponseCode {
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no data (no content)
  static const int badRequest = 400; // failure, API rejected request
  static const int unauthorized = 401; // failure, user is not authorised
  static const int forbidden = 403; // failure, API rejected request
  static const int internalServerError = 500; // failure, crash in server side
  static const int notFound = 404; // failure, not found
  static const int apiLogicError = 422; // API , logic error

  // local status code
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defaultError = -7;
}

class ResponseMessage {
  static const String noContent =
      ApiErrors.noContent; // success with no data (no content)
  static const String badRequest =
      ApiErrors.badRequestError; // failure, API rejected request
  static const String unauthorized =
      ApiErrors.unauthorizedError; // failure, user is not authorised
  static const String forbidden =
      ApiErrors.forbiddenError; // failure, API rejected request
  static const String internalServerError =
      ApiErrors.internalServerError; // failure, crash in server side
  static const String notFound =
      ApiErrors.notFoundError; // failure, crash in server side

  // local status code
  static const String connectTimeout = ApiErrors.timeoutError;
  static const String cancel = ApiErrors.defaultError;
  static const String receiveTimeout = ApiErrors.timeoutError;
  static const String sendTimeout = ApiErrors.timeoutError;
  static const String cacheError = ApiErrors.cacheError;
  static const String noInternetConnection = ApiErrors.noInternetError;
  static const String defaultError = ApiErrors.defaultError;
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    switch (this) {
      case DataSource.noContent:
        return ApiErrorModel(
          detail: ResponseMessage.noContent,
          message: ResponseMessage.noContent,
        );
      case DataSource.badRequest:
        return ApiErrorModel(
            detail: ResponseMessage.badRequest,
            message: ResponseMessage.badRequest);
      case DataSource.forbidden:
        return ApiErrorModel(
            detail: ResponseMessage.forbidden,
            message: ResponseMessage.forbidden);
      case DataSource.unauthorized:
        return ApiErrorModel(
            detail: ResponseMessage.unauthorized,
            message: ResponseMessage.unauthorized);
      case DataSource.notFound:
        return ApiErrorModel(
            detail: ResponseMessage.notFound,
            message: ResponseMessage.notFound);
      case DataSource.internalServerError:
        return ApiErrorModel(
            detail: ResponseMessage.internalServerError,
            message: ResponseMessage.internalServerError);
      case DataSource.connectTimeout:
        return ApiErrorModel(
            detail: ResponseMessage.connectTimeout,
            message: ResponseMessage.connectTimeout);
      case DataSource.cancel:
        return ApiErrorModel(
            detail: ResponseMessage.cancel, message: ResponseMessage.cancel);
      case DataSource.receiveTimeout:
        return ApiErrorModel(
            detail: ResponseMessage.receiveTimeout,
            message: ResponseMessage.receiveTimeout);
      case DataSource.sendTimeout:
        return ApiErrorModel(
            detail: ResponseMessage.sendTimeout,
            message: ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return ApiErrorModel(
            detail: ResponseMessage.cacheError,
            message: ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return ApiErrorModel(
            detail: ResponseMessage.noInternetConnection,
            message: ResponseMessage.noInternetConnection);
      case DataSource.defaultError:
        return ApiErrorModel(
            detail: ResponseMessage.defaultError,
            message: ResponseMessage.defaultError);
    }
  }
}

class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      apiErrorModel = _handleError(error);
    } else {
      // default error
      apiErrorModel = DataSource.defaultError.getFailure();
    }
  }
}

ApiErrorModel _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeout.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeout.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.defaultError.getFailure();
      }
    case DioExceptionType.unknown:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.defaultError.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.defaultError.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.defaultError.getFailure();
  }
}

class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}
