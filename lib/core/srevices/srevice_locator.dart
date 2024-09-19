import 'package:get_it/get_it.dart';
import 'package:todo_app/core/database/sqflite_helper.dart';
import 'package:todo_app/core/logic/cache_helper.dart';

final getIt = GetIt.instance;

  Future<void> setup() async{
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper(),);
  getIt.registerLazySingleton<SqfliteHelper>(() => SqfliteHelper(),);
}