import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/features/task/taskscreen.dart';
import 'package:todoapp/features/home/widgets/homebar.dart';
import 'package:todoapp/features/home/widgets/taskcard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        extendedPadding: EdgeInsets.symmetric(horizontal: 20.w),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskScreen()),
          );
        },
        label: Row(
          children: [
            Icon(Icons.add, size: 18.sp),
            Text(
              "Task",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeBar(),
              20.verticalSpace,

              Text(
                "Today's Tasks",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.only(bottom: 20.h),
                  itemBuilder: (context, index) => TaskCard(),
                  separatorBuilder: (context, index) => 10.verticalSpace,
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
