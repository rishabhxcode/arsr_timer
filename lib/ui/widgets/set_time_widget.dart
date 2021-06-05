import 'package:arsr_timer/cubit/end_time_setter/end_time_setter_cubit.dart';
import 'package:arsr_timer/cubit/set_timer/set_timer_cubit.dart';
import 'package:arsr_timer/cubit/timer_cubit/timer_cubit.dart';
import 'package:arsr_timer/cubit/timer_reset/timer_reset_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetTimeWidget extends StatefulWidget {
  @override
  _SetTimeWidgetState createState() => _SetTimeWidgetState();
}

class _SetTimeWidgetState extends State<SetTimeWidget> {
  String _time = '';
  bool _validateTime(TimeOfDay time) {
    if (time.hour == DateTime.now().hour &&
        time.minute > DateTime.now().minute) {
      return true;
    } else if (time.hour > DateTime.now().hour) {
      return true;
    } else {
      return false;
    }
  }

  int _endHour;
  int _endMinute;

  @override
  Widget build(BuildContext context) {
    return BlocListener<EndTimeSetterCubit, List<int>>(
        listener: (contex, state) {
          _endHour = state[0];
          _endMinute = state[1];
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              TextButton.icon(
                  onPressed: () async {
                    var time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      confirmText: 'CONFIRM',
                    );
                    if (time != null && _validateTime(time)) {
                      var _hour = time.hour > 9
                          ? time.hour.toString()
                          : time.hour.toString().padLeft(2, '0');
                      var _minute = time.minute > 9
                          ? time.minute.toString()
                          : time.minute.toString().padLeft(2, '0');
                      setState(() {
                        _time = '$_hour:$_minute';
                      });

                      BlocProvider.of<EndTimeSetterCubit>(context).setEndTime(
                          DateTime.now().add(Duration(
                              hours: time.hour, minutes: time.minute)));
                      BlocProvider.of<SetTimerCubit>(context)
                          .timerSetFor(time.hour, time.minute);
                      BlocProvider.of<TimerCubit>(context)
                          .startTimer(_endHour, _endMinute);
                      BlocProvider.of<TimerResetCubit>(context).start();
                    }
                    if (time != null) {
                      if (_validateTime(time) == false) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Row(
                          children: [
                            Icon(
                              Icons.warning_amber_rounded,
                              color: Colors.yellow,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text('Time should not be in the past!')
                          ],
                        )));
                        setState(() {
                          _time = '';
                        });
                      }
                    }
                  },
                  icon: Icon(Icons.timer),
                  label: Text('Set Time')),
              BlocBuilder<EndTimeSetterCubit, List<int>>(
                builder: (context, state) {
                  return Text('${state[0]}: ${state[1]}');
                },
              ) 
            ],
          ),
        ));
  }
}
