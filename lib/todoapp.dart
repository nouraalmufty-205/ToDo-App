import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/features/add_task/counter/counter_screen.dart';
import 'package:todoapp/features/add_task/counter/cubit/counter_cubit.dart';
import 'package:todoapp/features/splash/splashscreen.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(420, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(
            iconTheme: IconThemeData(color: Colors.deepPurple.shade100),
          ),
          home: BlocProvider(
            create: (context) => CounterCubit(),
            child: CounterScreen(),
          ),
        );
      },
    );
  }
}
