import 'package:flutter/material.dart';

Widget buildDurationTime(duration) {
  String twoDigits(int number) => number.toString().padLeft(2, '0');
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  return Text(
    '$minutes:$seconds',
    style: const TextStyle(
        color: Colors.orange, fontSize: 25, fontWeight: FontWeight.bold),
  );
}