import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownStatus extends StatefulWidget {
  final Function(String?)? onChange;
  const DropDownStatus({super.key, this.onChange});

  @override
  State<DropDownStatus> createState() => _DropDownStatusState();
}

class _DropDownStatusState extends State<DropDownStatus> {
  String _selectedStatus = 'Pending';
  @override
  Widget build(BuildContext context) {
    return Container(
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
        items: [
          'Pending',
          'Done',
          'In Progress',
        ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
        onChanged: (value) {
          setState(() => _selectedStatus = value!);
          widget.onChange?.call(value);
        },
      ),
    );
  }
}
