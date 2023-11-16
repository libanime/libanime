import 'package:libanime/libanime.dart';

/// SovetRomantica Example
void main(List<String> args) async {
  final sr = SovetRomantica();

  final video =
      await sr.parse("svr_link");
  print(video.url);
}
