import './time.dart';
import 'dart:convert';

bool isEpisodeCompleted(double currentTime, double duration) {
  final double endingTime = duration > minute * 10 ? minute * 3 : duration * 0.2;
  final double timeLeft = duration - currentTime;

  return timeLeft <= endingTime;
}
/*
Future<int> malToAnilist(int malId) {
  
}*/

Future wait(int seconds) async {
  await Future.delayed(Duration(seconds: seconds));
}

String prettyPrint(Map input) {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  return encoder.convert(input);
}

