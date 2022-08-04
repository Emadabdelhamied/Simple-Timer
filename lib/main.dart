import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/view/timer_screen.dart';
import 'bloc/timer_cubit.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp(),);
  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Builder(
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<TimerCubit>(
              create: (BuildContext context) => TimerCubit(),
            ),
          ],
          child: MaterialApp(
            title: "LeeTaxi Driver",
            debugShowCheckedModeBanner: false,
            debugShowMaterialGrid: false,
            theme: ThemeData(
              fontFamily: "Tajawal",
            ),
            home: Builder(builder: (context) {
              return const TimerScreen();


            }),
          ),
        );
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}