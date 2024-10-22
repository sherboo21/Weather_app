import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gst_task/core/helpers/extentions.dart';
import 'package:gst_task/core/widgets/app_text.dart';

import '../../../../core/helpers/app_imgs.dart';
import '../../../../core/helpers/app_size.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/model/weather.dart';

class HomeHeader extends StatelessWidget {
  final WeatherDataModel weatherDataModel;

  const HomeHeader({Key? key, required this.weatherDataModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Align(
          alignment: AlignmentDirectional.topCenter,
          child: Container(
            height: MediaQuery.sizeOf(context).height / 3.5,
            margin: EdgeInsets.only(bottom: AppSize.h50),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                image: DecorationImage(
                    image: AssetImage(AppImages.cloud), fit: BoxFit.cover)),
          ),
        ),
        Positioned(
          bottom: 0,
          left: AppSize.w20,
          right: AppSize.w20,
          child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              elevation: 5,
              child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      AppText(
                        text: weatherDataModel.name ?? '',
                        textSize: 20.sp,
                      ),
                      AppSize.h20.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: Column(
                              children: [
                                AppText(
                                  text: '34°C',
                                  textSize: 28.sp,
                                  textColor: AppColors.mainAppColor,
                                ),
                                AppText(
                                  text: weatherDataModel
                                          .weather![0].description ??
                                      '',
                                  textSize: 16.sp,
                                  textColor: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Image.asset(
                              AppIcons.icon,
                              fit: BoxFit.contain,
                              height: AppSize.h100,
                              width: AppSize.w100,
                            ),
                          )
                        ],
                      )
                    ],
                  ))),
        )
      ],
    );
  }
}
