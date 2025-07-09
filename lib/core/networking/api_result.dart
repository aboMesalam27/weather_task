import 'package:freezed_annotation/freezed_annotation.dart';
import 'api_error_model.dart';
part 'api_result.freezed.dart';
/// [ApiResult] is a generic class that represents the result of an API call.
/// It can be either a [Success] or a [Failure]
@Freezed()
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(ApiErrorModel apiErrorModel) = Failure<T>;
}
