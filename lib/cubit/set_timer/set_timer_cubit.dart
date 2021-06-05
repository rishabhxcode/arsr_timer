import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class SetTimerCubit extends Cubit<List<int>> {
  SetTimerCubit() : super([0, 0]);
  void timerSetFor(int hour, int minute) {
    emit(
        [hour - DateTime.now().hour, minute - DateTime.now().minute]);
  }
}
