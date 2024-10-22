import 'package:dartz/dartz.dart';
import 'package:gst_task/featuers/home/data/model/weather.dart';

import '../../../../core/networking/app_exceptions.dart';

abstract class HomeRepository {
  Future<Either<Failure, WeatherDataModel>> getWeather();
}
