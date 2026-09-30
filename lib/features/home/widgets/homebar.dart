import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/core/utile/app_constants.dart';
import 'package:todoapp/features/login/data/user_model.dart';

class HomeBar extends StatelessWidget {
  const HomeBar({super.key});

  @override
  Widget build(BuildContext context) {
    getUserData() {
      final UserModel? user = Hive.box<UserModel>(
        AppConstants.userBox,
      ).get(AppConstants.currentUser);
    }

    return Row(
      children: [
        // CircleAvatar(radius:30,backgroundImage:user?image !=null?FileImage(File(user?image!)): ,)
      ],
    );
  }
}
