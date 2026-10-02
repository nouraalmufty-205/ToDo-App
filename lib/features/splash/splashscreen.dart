import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:todoapp/core/utile/app_constants.dart';
import 'package:todoapp/features/home/homescreen.dart';
import 'package:todoapp/features/login/data/user_model.dart';

import 'package:todoapp/features/login/loginscreens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      nextPage();
    });
  }

  nextPage() {
    UserModel? user = Hive.box<UserModel>(
      AppConstants.userBox,
    ).get(AppConstants.currentUser);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => user == null ? LoginScreen() : HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset("assets/translations/icons/Notes.json")),
    );
  }
}
