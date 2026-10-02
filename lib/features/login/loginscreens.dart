import 'dart:io';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todoapp/core/utile/app_constants.dart';
import 'package:todoapp/core/widgets/purplebutton.dart';
import 'package:todoapp/features/home/homescreen.dart';
import 'package:todoapp/features/login/data/user_model.dart';
import 'package:todoapp/gen/locale_keys.g.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final picker = ImagePicker();

  XFile? photo;
  pickImageFromCamera() async {
    photo = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  pickImageFromGallery() async {
    photo = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  SaveUserData(UserModel user) {
    Hive.box<UserModel>(AppConstants.userBox)
        .put(AppConstants.currentUser, user)
        .then((value) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        })
        .catchError((error) {
          print(error);
        });
  }

  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,

                    builder: (context) => Padding(
                      padding: EdgeInsets.all(16.0.r),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PurpleButton(
                            title: "Camera",
                            onTap: () {
                              Navigator.pop(context);
                              pickImageFromCamera();
                            },
                          ),
                          15.verticalSpace,
                          PurpleButton(
                            title: "Gallery",
                            onTap: () {
                              Navigator.pop(context);
                              pickImageFromGallery();
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 60.r,
                  backgroundColor: Colors.deepPurple.shade100,
                  backgroundImage: photo != null
                      ? Image.file(File(photo?.path ?? "")).image
                      : null,
                  child: photo == null ? Icon(Icons.person) : null,
                ),
              ),
              10.verticalSpace,

              Text(
                "login_title".tr(),
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
              ),
              Text("login_subtitle".tr(), style: TextStyle(color: Colors.grey)),

              15.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.full_name.tr(),
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  10.verticalSpace,
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 18.h,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  20.verticalSpace,
                  PurpleButton(
                    title: LocaleKeys.continue_button.tr(),
                    onTap: () {
                      if (photo == null) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Error"),
                            content: Text("image is required "),
                          ),
                        );

                        return;
                      }
                      SaveUserData(
                        UserModel(
                          name: nameController.text,
                          image: photo?.path ?? "",
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
