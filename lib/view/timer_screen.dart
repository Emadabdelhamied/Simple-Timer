import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/bloc/timer_cubit.dart';
import 'package:timer/widgets/convert_time.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => TimerCubit(),
        child: BlocConsumer<TimerCubit, TimerState>(
          listener: (context, state) {},
          builder: (context, state) {
            final bloc = TimerCubit.get(context);
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildDurationTime(Duration(seconds: bloc.start)),
                  const SizedBox(height: 50,),
                  Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.orange
                    ),
                    child: TextButton(
                        onPressed: () {
                          bloc.startTimer();
                        },
                        child: const Text(
                          'Send',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
