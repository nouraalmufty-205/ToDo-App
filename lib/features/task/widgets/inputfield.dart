import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputField extends StatelessWidget {
  final int? lines;
  final String title;
  final Function()? onTap;
  final TextEditingController? controller;

  const InputField({
    super.key,
    this.lines,
    required this.title,
    this.onTap,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: onTap != null,
      maxLines: lines,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15.r),
        ),

        fillColor: Colors.white,
        filled: true,
        hintText: title,
      ),
      onTap: onTap,
    );
  }
}
