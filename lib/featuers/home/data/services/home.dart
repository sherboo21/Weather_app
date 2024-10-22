import 'package:dartz/dartz.dart';
import 'package:gst_task/core/networking/app_constants.dart';
import 'package:gst_task/featuers/home/data/model/weather.dart';
import 'package:gst_task/featuers/home/data/repos/home.dart';

import '../../../../core/helpers/get_current_location.dart';
import '../../../../core/helpers/main_functions.dart';
import '../../../../core/networking/app_exceptions.dart';

class HomeServices extends HomeRepository {
  @override
  Future<Either<Failure, WeatherDataModel>> getWeather() async {
    return await makeApiCall<WeatherDataModel>(
      method: 'GET',
      url: AppConstants.baseUrl,
      params: {
        'appid': AppConstants.apiKey,
        'lat': (await currentPosition()).latitude.toString(),
        'lon': (await currentPosition()).longitude.toString(),
      },
      fromJson: (json) => WeatherDataModel.fromJson(json),
    );
  }
}
