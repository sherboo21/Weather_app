import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../networking/app_exceptions.dart';
import '../networking/dio.dart';

/// custom api call function ///
Future<Either<Failure, T>> makeApiCall<T>({
  required String method,
  required String url,
  Map<String, dynamic>? params,
  dynamic data,
  required T Function(dynamic) fromJson,
  Function(Response?)? errorHandler,
  successHandler,
}) async {
  try {
    Response? response;
    if (method == 'GET') {
      response = await DioHelper.getData(url: url, params: params);
      // we can add another methods like post , puy and delete
    } else {
      throw UnimplementedError('Method $method is not implemented');
    }

    if (response != null && response.statusCode == 200) {
      log(response.data.toString());
      if (successHandler != null) {
        successHandler(response);
      }
      final responseData = fromJson(response.data);
      return Right(responseData);
    } else {
      log(response!.data.toString());
      if (errorHandler != null) {
        errorHandler(response);
      }
      return Left(ServerFailure(response.statusCode.toString()));
    }
  } catch (e) {
    log(e.toString());
    return Left(ServerFailure(e.toString()));
  }
}
