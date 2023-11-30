import 'package:libanime/parsers/anime.dart';

/// SovetRomantica Example
void main(List<String> args) async {
  final sr = SovetRomantica();

  final video = await sr
      .parse("https://sovetromantica.com/embed/episode_1459_1-subtitles");
  print(video.url);
}
