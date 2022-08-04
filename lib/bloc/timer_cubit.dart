import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitial());

  static TimerCubit get(BuildContext context) => BlocProvider.of(context);
  Timer? _timer;
  int start = 60;
  bool timerVisibility = true;
  var oneSec = const Duration(seconds: 1);

  String twoDigits(int number) => number.toString().padLeft(2, '0');

  void startTimer() {
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          timer.cancel();
          emit(TimerEnd());
          start = 60;
        } else {
          emit(TimerStart());
          start--;
        }
      },
    );
  }
}
