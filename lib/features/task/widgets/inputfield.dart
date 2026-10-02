import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputField extends StatelessWidget {
  final int? lines;
  final String title;
  final Function()? onTap;

  const InputField({super.key, this.lines, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
