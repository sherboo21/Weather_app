import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gst_task/core/helpers/extentions.dart';
import 'package:gst_task/core/widgets/app_text.dart';

import '../../../../core/helpers/app_imgs.dart';
import '../../../../core/helpers/app_size.dart';
import '../../data/model/weather_options.dart';

class HomeItem extends StatelessWidget {
  final List<WeatherOptions> weatherOptionsList;
  final int index;

  const HomeItem(
      {Key? key, required this.weatherOptionsList, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(10.r),
      color: Colors.transparent,
      child: Container(
        width: 110.w,
        padding: EdgeInsets.symmetric(
            vertical: AppSize.h15, horizontal: AppSize.w20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r), color: Colors.white),
        child: Column(
          children: [
            AppText(
              text: weatherOptionsList[index].title,
              maxLines: 1,
              textSize: 20.sp,
              textAlign: TextAlign.center,
              textOverflow: TextOverflow.ellipsis,
            ),
            AppSize.h10.ph,
            AppText(
              text: weatherOptionsList[index].value.toString(),
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              textColor: Colors.grey,
            ),
            AppSize.h10.ph,
            Image.asset(
              AppIcons.icon,
              fit: BoxFit.contain,
              height: AppSize.h60,
              width: AppSize.w60,
            )
          ],
        ),
      ),
    );
  }
}
