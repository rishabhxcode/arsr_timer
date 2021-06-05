import 'package:arsr_timer/cubit/set_timer/set_timer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerSetDisplay extends StatefulWidget {
  @override
  _TimerSetDisplayState createState() => _TimerSetDisplayState();
}

class _TimerSetDisplayState extends State<TimerSetDisplay> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetTimerCubit, List<int>>(
      builder: (context, state) {
        return Text('Timer set for: ${state[0]}h  ${state[1]}m');
      },
    );
  }
}
