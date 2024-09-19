import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/logic/cache_helper.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/splash/splash_screen.dart';
import 'core/database/sqflite_helper.dart';
import 'core/srevices/srevice_locator.dart';
import 'core/theme_services/theme_services.dart';
import 'core/utils/app_routes.dart';
import 'features/add_task/add_task_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  await getIt<CacheHelper>().init();
  await getIt<SqfliteHelper>().initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TaskBloc()..getTasks()),
        ],
        child: MaterialApp(
          title: AppStrings.appName,
          theme: Styles.themeData(),
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.splashRoute,
          debugShowCheckedModeBanner: false,
          home: child,
        ),
      ),
      child: const SplashScreen(),
    );
  }
}
