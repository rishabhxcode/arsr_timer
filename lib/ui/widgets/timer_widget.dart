import 'package:arsr_timer/cubit/timer_cubit/timer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerWidget extends StatefulWidget {
  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, List<int>>(
      builder: (context, state) {
        String hours = state[0] > 9
            ? state[0].toString()
            : state[0].toString().padLeft(2, '0');
        String minutes = state[1] > 9
            ? state[1].toString()
            : state[1].toString().padLeft(2, '0');
        String seconds = state[2] > 9
            ? state[2].toString()
            : state[2].toString().padLeft(2, '0');
        String milliseconds = state[3] < 9
            ? state[3].toString().padLeft(4, '0')
            : state[3] > 9 && state[3] < 100
                ? state[3].toString().padLeft(4, '0')
                : state[3].toString().padLeft(4, '0');

        return Text(
          '$hours:$minutes:$seconds:$milliseconds',
          style: TextStyle(fontSize: 20),
        );
      },
    );
  }
}
