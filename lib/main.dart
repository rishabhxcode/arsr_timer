import 'package:arsr_timer/cubit/current_time_ticker/current_time_ticker_cubit.dart';
import 'package:arsr_timer/cubit/end_time_setter/end_time_setter_cubit.dart';
import 'package:arsr_timer/cubit/set_timer/set_timer_cubit.dart';
import 'package:arsr_timer/cubit/timer_cubit/timer_cubit.dart';
import 'package:arsr_timer/cubit/timer_reset/timer_reset_cubit.dart';
import 'package:arsr_timer/ui/timer_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SetTimerCubit>(
            create: (context) => SetTimerCubit(),
          ),
          BlocProvider<EndTimeSetterCubit>(
            create: (context) => EndTimeSetterCubit(),
          ),
          BlocProvider<TimerResetCubit>(
            create: (context) => TimerResetCubit(),
          ),
          BlocProvider<CurrentTimeTickerCubit>(
            create: (context) => CurrentTimeTickerCubit(),
          ),
          BlocProvider<TimerCubit>(
            create: (context) => TimerCubit(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: TimerHomePage(),
        ));
  }
}
