import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/design/app_image.dart';
import 'package:todo_app/core/design/title_text.dart';
import 'package:todo_app/core/utils/app_color.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/assets.dart';
import 'package:todo_app/core/utils/spacing.dart';
import 'package:todo_app/core/utils/text_style_theme.dart';
import '../../auth/login/login_screen.dart';
import '../../auth/register/register_screen.dart';
import '../../on_boarding/on_boarding_screen.dart';
import '../../splash/splash_screen.dart';
import '../../view/home/home_view.dart';
import '../../view/home/screens/add_task_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String homeRoute = "/home";
  static const String addTaskRoute = "/addTask";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        );
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
      case Routes.onBoardingRoute:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
        case Routes.addTaskRoute:
        return MaterialPageRoute(
          builder: (context) => const AddTaskScreen(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.noRouteFound,
            style: TextStyle(
              color: AppColor.white,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppImage(
                AssetsData.noTasks,
                height: 227.h,
                width: 227.h,
              ),
              verticalSpace(20),
              TitleTextWidget(
                label: AppStrings.noRouteFound,
                textStyle: TextStyleTheme.textStyle30Regular,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
