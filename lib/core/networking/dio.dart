import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'app_constants.dart';
import 'app_exceptions.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: AppConstants.baseUrl,
      receiveDataWhenStatusError: true,
    ));
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 100,
      ),
    );
  }

  /// Get FUNCTION ///
  static Future<Response?> getData({
    required String url,
    Map<String, dynamic>? params,
  }) async {
    try {
      // init().options.headers = {
      //   'Authorization': 'Bearer $token}',
      // };
      return await dio.get(url, queryParameters: params);
    } on SocketException {
      throw AppExceptions('Problem with internet connection.');
    } on HandshakeException {
      throw AppExceptions('Your have a problem in internet connection');
    } on TimeoutException {
      throw AppExceptions('Problem with internet connection.');
    } on DioException catch (e) {
      log(e.message.toString(), name: 'Error');
      log(e.response.toString(), name: 'Error');
    }
    return null;
  }
}
