import 'package:btcare/core/error/error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_response.freezed.dart';

@Freezed()
abstract class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse.data(T data) = Success<T>;
  const factory ApiResponse.error({required ErrorHandler error}) = Fail<T>;
}
