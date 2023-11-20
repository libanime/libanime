import '../lib/parsers/anime/aniboom/aniboom.dart';

final aniboom = Aniboom();

void main() async {
  final obj = await aniboom.parse(
      "https://aniboom.one/embed/lk8qW14XmoO?episode=1&translation=30", true);
  print(obj);
}
