import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class EndTimeSetterCubit extends Cubit<List<int>> {
  EndTimeSetterCubit() : super([0, 0]);
  void setEndTime(DateTime time) {
    emit([time.hour, time.minute]);
  }
}
