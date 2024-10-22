import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gst_task/featuers/home/data/model/weather.dart';
import 'package:gst_task/featuers/home/data/repos/home.dart';

import '../../../core/networking/app_exceptions.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;

  HomeCubit(this._homeRepository) : super(HomeInitial());

  WeatherDataModel weatherDataModel = WeatherDataModel();

  /// get weather ///
  void getWeather() => _onGetWeather();

  void _onGetWeather() async {
    emit(GetWeatherLoading());
    final result = await _homeRepository.getWeather();
    result.fold(
      (error) => emit(GetWeatherError(error)),
      (data) {
        emit(GetWeatherSuccess(data));
        weatherDataModel = data;
      },
    );
  }
}
