import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gst_task/core/helpers/extentions.dart';
import 'package:gst_task/featuers/home/data/model/weather_options.dart';

import '../../../../core/helpers/app_size.dart';
import '../../../../core/helpers/app_strings.dart';
import '../../logic/home_cubit.dart';
import 'home_item.dart';

class HomeBuilder extends StatelessWidget {

  const HomeBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final List<WeatherOptions> weatherOptionsList = [
      WeatherOptions(
          title: AppStrings.pressure,
          value:
          context.read<HomeCubit>().weatherDataModel.main!.pressure ??
              '-'),
      WeatherOptions(
          title: AppStrings.windSpeed,
          value: context.read<HomeCubit>().weatherDataModel.wind!.speed ??
              '-'),
      WeatherOptions(
          title: AppStrings.clouds,
          value: context.read<HomeCubit>().weatherDataModel.clouds!.all ??
              '-'),
    ];
    return SizedBox(
      height: 170.h,
      child: Center(
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: AppSize.w15),
          itemCount: weatherOptionsList.length,
          itemBuilder: (context, index) =>HomeItem(weatherOptionsList: weatherOptionsList, index: index),
          separatorBuilder: (context, index) => AppSize.w10.pw,
        ),
      ),
    );
  }
}
