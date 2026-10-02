import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/features/task/widgets/inputfield.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  String _selectedStatus = 'Pending';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Add Task", style: TextStyle(fontSize: 24.sp)),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Task Title",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              10.verticalSpace,
              InputField(title: "add a title"),
              20.verticalSpace,

              Text(
                "Description",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              10.verticalSpace,
              InputField(title: "Task Description", lines: 4),
              20.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Time",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        10.verticalSpace,
                        InputField(
                          title: "Time",
                          onTap: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  10.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        10.verticalSpace,
                        InputField(
                          title: "Date",
                          onTap: () {
                            showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2027),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                "Status",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: DropdownButton<String>(
                  value: _selectedStatus,
                  isExpanded: true,
                  dropdownColor: Colors.white,
                  underline: const SizedBox(),
                  items: ['Pending', 'Done', 'In Progress']
                      .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                      .toList(),
                  onChanged: (value) =>
                      setState(() => _selectedStatus = value!),
                ),
              ),
              20.verticalSpace,
              Text(
                "Choose Color",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
