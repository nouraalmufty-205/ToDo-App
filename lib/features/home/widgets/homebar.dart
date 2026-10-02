import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/core/utile/app_constants.dart';
import 'package:todoapp/features/login/data/user_model.dart';

class HomeBar extends StatelessWidget {
  const HomeBar({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel? user = Hive.box<UserModel>(
      AppConstants.userBox,
    ).get(AppConstants.currentUser);

    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: user != null ? FileImage(File(user.image)) : null,
        ),
        10.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning",
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              user?.name ?? "User",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        Spacer(),
        IconButton(
          icon: Icon(Icons.language, size: 30, color: Colors.black),
          onPressed: () {
            if (context.locale.languageCode == 'en') {
              context.setLocale(Locale('ar'));
            } else {
              context.setLocale(Locale('en'));
            }
          },
        ),
      ],
    );
  }
}
