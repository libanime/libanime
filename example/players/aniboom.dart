import 'package:libanime/parsers/anime.dart';

final aniboom = Aniboom();

void main() async {
  // Without extra option returns Video
  final obj = await aniboom
      .parse("https://aniboom.one/embed/lk8qW14XmoO?episode=1&translation=30");
  print(obj);
}
