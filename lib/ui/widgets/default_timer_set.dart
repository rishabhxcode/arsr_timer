import 'package:arsr_timer/cubit/end_time_setter/end_time_setter_cubit.dart';
import 'package:arsr_timer/cubit/set_timer/set_timer_cubit.dart';
import 'package:arsr_timer/cubit/timer_cubit/timer_cubit.dart';
import 'package:arsr_timer/cubit/timer_reset/timer_reset_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultTimerSet extends StatefulWidget {
  @override
  _DefaultTimerSetState createState() => _DefaultTimerSetState();
}

class _DefaultTimerSetState extends State<DefaultTimerSet> {
  bool _switch = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Default Timer Set'),
        CupertinoSwitch(
            value: _switch,
            onChanged: (val) {
              setState(() {
                _switch = !_switch;
              });
              if (_switch) {
                BlocProvider.of<EndTimeSetterCubit>(context)
                    .setEndTime(DateTime.now().add(Duration(minutes: 20)));
                BlocProvider.of<SetTimerCubit>(context).timerSetFor(
                    DateTime.now().hour,
                    DateTime.now().add(Duration(minutes: 20)).minute);
                BlocProvider.of<TimerCubit>(context).startTimer(
                    DateTime.now().hour,
                    DateTime.now().add(Duration(minutes: 20)).minute);
                BlocProvider.of<TimerResetCubit>(context).start();
              } else {
                BlocProvider.of<TimerResetCubit>(context).neutralize();
                BlocProvider.of<TimerCubit>(context).resetTimer();
              }
            })
      ],
    );
  }
}
