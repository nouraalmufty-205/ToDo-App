import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:todoapp/core/model/task_model.dart';
import 'package:todoapp/core/utile/app_constants.dart';
import 'package:todoapp/features/task/taskscreen.dart';
import 'package:todoapp/features/home/widgets/homebar.dart';
import 'package:todoapp/features/home/widgets/taskcard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<TaskModel> tasks = Hive.box<TaskModel>(
      AppConstants.taskUser,
    ).values.toList();
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        extendedPadding: EdgeInsets.symmetric(horizontal: 20.w),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskScreen()),
          );
          setState(() {});
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

              tasks.isNotEmpty
                  ? Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.only(bottom: 20.h),
                        itemBuilder: (context, index) => InkWell(
                          onLongPress: () async {
                            await Hive.box<TaskModel>(
                              AppConstants.taskUser,
                            ).deleteAt(index);
                            setState(() {});
                          },
                          child: TaskCard(taskModel: tasks[index]),
                        ),
                        separatorBuilder: (context, index) => 10.verticalSpace,
                        itemCount: tasks.length,
                      ),
                    )
                  : Expanded(
                      child: Lottie.asset(
                        'assets/translations/icons/Notes.json',
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
