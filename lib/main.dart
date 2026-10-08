import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/core/model/task_model.dart';
import 'package:todoapp/core/utile/app_constants.dart';
import 'package:todoapp/features/login/data/user_model.dart';
import 'package:todoapp/todoapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<UserModel>(AppConstants.userBox);
  await Hive.openBox<TaskModel>(AppConstants.taskUser);
  Hive.box<TaskModel>(AppConstants.taskUser).clear();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: ToDoApp(),
    ),
  );
}
