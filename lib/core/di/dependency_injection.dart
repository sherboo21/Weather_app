import 'package:get_it/get_it.dart';
import 'package:gst_task/core/helpers/appCubit/app_cubit.dart';
import 'package:gst_task/featuers/home/data/repos/home.dart';

import '../../featuers/home/data/services/home.dart';
import '../../featuers/home/logic/home_cubit.dart';
import '../networking/dio.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  /// FOR DIO HELPER ///
  await DioHelper.init();
  getIt.registerLazySingleton<DioHelper>(() => DioHelper());

  getIt.registerFactory<AppCubit>(() => AppCubit());

  /// FOR Home ///
  getIt.registerLazySingleton<HomeRepository>(() => HomeServices());
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
