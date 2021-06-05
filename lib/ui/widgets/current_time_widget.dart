import 'package:arsr_timer/cubit/current_time_ticker/current_time_ticker_cubit.dart';
import 'package:arsr_timer/cubit/timer_cubit/timer_cubit.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentTimeWidget extends StatefulWidget {
  @override
  _CurrentTimeWidgetState createState() => _CurrentTimeWidgetState();
}

class _CurrentTimeWidgetState extends State<CurrentTimeWidget> {
  var _currentTime = DateTime.now();
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('HH:MM:SS'),
        BlocBuilder<CurrentTimeTickerCubit, List<int>>(builder: (context, state) {
            var hours = state[0] > 9
                ? state[0].toString()
                : state[0].toString().padLeft(2, '0');
            var minutes = state[1] > 9
                ? state[1].toString()
                : state[1].toString().padLeft(2, '0');
            var seconds = state[2] > 9
                ? state[2].toString()
                : state[2].toString().padLeft(2, '0');
            return Text(
              '$hours:$minutes:$seconds',
              style: TextStyle(color: Colors.black, fontSize: 42),
            );
          
    
          
        }),
      ],
    );
  }
}
