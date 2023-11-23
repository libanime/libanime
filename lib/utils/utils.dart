import './time.dart';

bool isEpisodeCompleted(double currentTime, double duration) {
  final double endingTime = duration > minute * 10 ? minute * 3 : duration * 0.2;
  final double timeLeft = duration - currentTime;

  return timeLeft <= endingTime;
}
/*
Future<int> malToAnilist(int malId) {
  
}*/


