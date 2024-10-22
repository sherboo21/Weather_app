import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../featuers/home/logic/home_cubit.dart';
import '../../featuers/home/view/home_screen.dart';
import '../di/dependency_injection.dart';
import 'named_router.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreenRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<HomeCubit>()..getWeather(),
                  child: const HomeScreen(),
                ));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
