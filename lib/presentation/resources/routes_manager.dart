import 'package:flutter/material.dart';
import 'package:task/presentation/resources/strings_manager.dart';

import '../../app/dit.dart';
import '../main/view/main_view_with_bloc.dart';
import '../main/view/view_image.dart';
import '../splash/splash_view.dart';

class Routes {
  static const String splashRoute = '/';

  static const String mainRoute = '/main';
  static const String fullImageRoute = '/fullImageRoute';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());

      case Routes.fullImageRoute:
        Map arguments = settings.arguments as Map;
        String url = '';
        if (arguments != null) {
          url = arguments['imageUrl'];
        }
        return MaterialPageRoute(builder: (_) => ViewImageWidget(url: url,));

      case Routes.mainRoute:
        initHomeModule();
        return MaterialPageRoute(builder: (_) => MainViewCubit());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
