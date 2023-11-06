import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:libanime/parsers/kodik/kodik.dart';

void main() async {
  test('search mappings by url', () async {
    final kodik = Kodik("ENTER_YOUR_TOKEN_HERE");
    // ⚠ Warning! This script made by author for local tests.
    var link = await kodik.mappingsFromLink("//aniqit.com/serial/55144/50ae9bda1c892f55fbafd411ad102b0c/720p");
    expect(link, {"kinopoisk": "4438605", "imdb": "tt14476244", "worldart": "http://www.world-art.ru/animation/animation.php?id=11193", "shikimori": "50664"});
  });
}