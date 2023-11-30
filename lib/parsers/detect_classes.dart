import 'package:libanime/parsers/anime.dart';
import 'package:libanime/parsers/anime/aniboom/aniboom.dart';

Map<String, dynamic> classes = {
  "kodik": Kodik(),
  "csst": CSST(),
  "sibnet": Sibnet(),
  "sovetromantica": SovetRomantica(),
  "aniboom": Aniboom()
};
