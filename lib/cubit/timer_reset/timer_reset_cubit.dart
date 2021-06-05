import 'package:bloc/bloc.dart';

class TimerResetCubit extends Cubit<bool> {
  TimerResetCubit() : super(null);
  void reset() {
    emit(true);
  }

  void start() {
    emit(false);
  }

  void neutralize() {
    emit(null);
  }
}
