import 'package:arsr_timer/cubit/current_time_ticker/current_time_ticker_cubit.dart';
import 'package:arsr_timer/cubit/timer_cubit/timer_cubit.dart';
import 'package:arsr_timer/ui/widgets/timer_reset_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/current_time_widget.dart';
import 'widgets/default_timer_set.dart';
import 'widgets/set_time_widget.dart';
import 'widgets/timer_set_display.dart';
import 'widgets/timer_widget.dart';

class TimerHomePage extends StatefulWidget {
  const TimerHomePage({Key key}) : super(key: key);

  @override
  _TimerHomePageState createState() => _TimerHomePageState();
}

class _TimerHomePageState extends State<TimerHomePage> {
  @override
  void initState() {
    BlocProvider.of<CurrentTimeTickerCubit>(context).timeTicker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CurrentTimeWidget(),
            TimerSetDisplay(),
            TimerWidget(),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: SetTimeWidget()),
                // StartStopButton(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TimerResetButton()
                  ),
                )
              ],
            ),
            DefaultTimerSet()
          ]),
    );
  }
}
