import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../routing/named_router.dart';
import '../routing/named_router_impl.dart';
import '../theme/app_theme.dart';

class WeatherApp extends StatelessWidget {
  final AppRouter appRouter;

  const WeatherApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) => GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: MaterialApp(
                themeAnimationDuration: const Duration(milliseconds: 700),
                themeAnimationCurve: Curves.easeInOutCubic,
                initialRoute: Routes.homeScreenRoute,
                onGenerateRoute: appRouter.generateRoute,
                debugShowCheckedModeBanner: false,
                title: 'Weather App',
                theme: AppTheme.lightThemeData,
              ),
            ));
  }
}
