import 'package:libanime/parsers/anime.dart';

void main(List<String> args) async {
  final kodik = Kodik();
  var link = await kodik.parse(
      "https://kodik.info/seria/1133512/04d5f7824ba3563bd78e44a22451bb45/720p",
      true);
  print(link!["360"]?.url);
}
