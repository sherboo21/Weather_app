import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gst_task/core/app/weather_app.dart';

import 'core/di/dependency_injection.dart';
import 'core/helpers/bloc_observer.dart';
import 'core/routing/named_router_impl.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait<void>([ScreenUtil.ensureScreenSize(), setupGetIt()]);
  Bloc.observer = MyBlocObserver();
  runApp(WeatherApp(
    appRouter: AppRouter(),
  ));
}
