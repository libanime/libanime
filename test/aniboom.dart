import '../lib/parsers/anime/aniboom/aniboom.dart';
import 'dart:convert';

final aniboom = Aniboom();

void main() async {
  final obj = await aniboom.parse("https://aniboom.one/em");
  print(obj!.quality);
}