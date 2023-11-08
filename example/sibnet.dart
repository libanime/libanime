import 'package:libanime/libanime.dart';

/// Sibnet Examples
void main(List<String> args) async {
  final sibnet = Sibnet();

  final video =
      await sibnet.parse("https://video.sibnet.ru/shell.php?videoid=2235917");
  print(video.url);
}
