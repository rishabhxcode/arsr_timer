import 'package:bloc/bloc.dart';
import 'dart:async';

class CurrentTimeTickerCubit extends Cubit<List<int>> {
  CurrentTimeTickerCubit() : super([DateTime.now().hour,DateTime.now().minute, DateTime.now().second,  ]);
    void timeTicker() {
    Timer.periodic(
        Duration(seconds: 1),
        (timer) => emit(
            [DateTime.now().hour,
             DateTime.now().minute,
             DateTime.now().second]));
  }
}
