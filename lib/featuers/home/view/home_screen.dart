import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gst_task/core/helpers/extentions.dart';
import 'package:gst_task/core/widgets/custom_conditional_builder.dart';

import '../../../core/helpers/app_size.dart';
import '../../../core/theme/app_colors.dart';
import '../logic/home_cubit.dart';
import 'components/home_builder.dart';
import 'components/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
              child: CustomConditionalBuilder(
            condition: state is! GetWeatherLoading,
            builder: (context) => ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                HomeHeader(
                    weatherDataModel:
                        context.read<HomeCubit>().weatherDataModel),
                AppSize.h20.ph,
                const HomeBuilder()
              ],
            ),
            fallBack: (context) => Center(
              child: CircularProgressIndicator(color: AppColors.mainAppColor),
            ),
          )),
        );
      },
    );
  }
}
