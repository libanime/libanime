import '../lib/wrappers/anime/jikan/anime.dart';
import 'dart:convert';

final anime = Jikan(30);

void main() async {
  final obj = await anime.episode(3);
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String prettyprint = encoder.convert(obj);
  print(prettyprint);
}