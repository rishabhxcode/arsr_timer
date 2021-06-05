import 'package:arsr_timer/cubit/end_time_setter/end_time_setter_cubit.dart';
import 'package:arsr_timer/cubit/timer_cubit/timer_cubit.dart';
import 'package:arsr_timer/cubit/timer_reset/timer_reset_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerResetButton extends StatefulWidget {
  @override
  _TimerResetButtonState createState() => _TimerResetButtonState();
}

class _TimerResetButtonState extends State<TimerResetButton> {
  int _endHour;
  int _endMinute;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerResetCubit, bool>(
      builder: (context, state) {
        var _isReset = state;
        return BlocListener<EndTimeSetterCubit, List<int>>(
            listener: (context, endTime) {
              _endHour = endTime[0];
              _endMinute = endTime[1];
            },
            child: TextButton.icon(
              icon: Icon(
                  state == false ? Icons.timelapse_outlined : Icons.restore),
              label: Text(state == false ? 'Reset' : 'Start'),
              onPressed: state == null
                  ? null
                  : () {
                      if (_isReset) {
                        BlocProvider.of<TimerResetCubit>(context).start();
                        BlocProvider.of<TimerCubit>(context)
                            .startTimer(_endHour, _endMinute);
                      } else {
                        BlocProvider.of<TimerResetCubit>(context).reset();
                        BlocProvider.of<TimerCubit>(context).resetTimer();
                      }
                    },
            ));
      },
    );
  }
}
