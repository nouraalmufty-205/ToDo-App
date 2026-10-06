import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/core/model/task_model.dart';
import 'package:todoapp/core/utile/app_constants.dart';
import 'package:todoapp/core/widgets/purplebutton.dart';
import 'package:todoapp/features/task/widgets/dropdownstatus.dart';
import 'package:todoapp/features/task/widgets/inputfield.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Color> taskcolors = [
    Colors.blue,
    Colors.orange,
    Colors.red,
    Colors.green,
    Colors.black,
  ];
  var titleController = TextEditingController();
  var descritptionController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  var statusController = TextEditingController();
  int? selectedColor;

  @override
  void dispose() {
    titleController.dispose();
    descritptionController.dispose();
    dateController.dispose();
    timeController.dispose();
    statusController.dispose();
    super.dispose();
  }

  void savetask(TaskModel task) {
    Hive.box<TaskModel>(AppConstants.taskUser)
        .add(task)
        .then((value) {
          Navigator.pop(context);
        })
        .catchError((e) {
          print("error $e");
        });
  }

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
              InputField(title: "Add a Title", controller: titleController),
              20.verticalSpace,

              Text(
                "Description",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              10.verticalSpace,
              InputField(
                title: "Task Description",
                lines: 4,
                controller: descritptionController,
              ),
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
                          controller: timeController,
                          title: "Time",
                          onTap: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((value) {
                              timeController.text =
                                  value?.format(context) ?? '';
                            });
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
                          controller: dateController,
                          title: "Date",
                          onTap: () {
                            showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2027),
                            ).then((value) {
                              dateController.text = DateFormat.MEd().format(
                                value ?? DateTime.now(),
                              );
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              Text(
                "Status",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              10.verticalSpace,
              DropDownStatus(
                onChange: (v) {
                  statusController.text = v ?? '';
                },
              ),

              20.verticalSpace,
              Text(
                "Choose Color",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              10.verticalSpace,
              SizedBox(
                height: 40.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: taskcolors.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        selectedColor = index;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: taskcolors[index],
                      child: index == selectedColor
                          ? Icon(Icons.check, color: Colors.white)
                          : null,
                    ),
                  ),
                  separatorBuilder: (context, index) => 10.horizontalSpace,
                ),
              ),
              20.verticalSpace,
              PurpleButton(
                title: "Save Task",
                onTap: () {
                  savetask(
                    TaskModel(
                      title: titleController.text,
                      description: descritptionController.text,
                      status: statusController.text,
                      date: dateController.text,
                      time: timeController.text,
                      color: taskcolors[selectedColor ?? 0].toARGB32(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
