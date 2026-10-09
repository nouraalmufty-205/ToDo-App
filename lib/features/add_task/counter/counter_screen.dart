import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/features/add_task/counter/cubit/counter_cubit.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Row(
                spacing: 40.w,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<CounterCubit>().IncrementCounter();
                    },
                    icon: Icon(Icons.add, size: 40),
                  ),
                  Text(
                    context.read<CounterCubit>().counter.toString(),
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<CounterCubit>().DecrementCounter();
                    },
                    icon: Icon(Icons.remove, size: 40),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
