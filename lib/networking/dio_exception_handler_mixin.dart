import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import 'package:quireloginform/core/core.dart';

mixin DioExceptionHandler {
  Future<Either<Failure, T>> handleRequest<T>(Future<T> Function() cb) async {
    try {
      return Right(await cb());
    } on DioException catch (dioError) {
      String errorMessage = 'Unknown network error occurred';
      if (dioError.response != null && dioError.response!.data != null) {
        final responseData = dioError.response!.data;
        if (responseData is Map && responseData.containsKey('message')) {
          errorMessage = responseData['message'];
        }
      }
      return Left(NetworkFailure(errorMessage));
    } on Failure catch (failure) {
      return Left(failure);
    } catch (err, stackTrace) {
      return Left(InternalAppFailure(err.toString(), stackTrace));
    }
  }
}
