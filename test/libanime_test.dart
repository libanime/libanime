import 'package:libanime/parsers/anime.dart';
import 'package:test/test.dart';

void main() {
  /// Parsers tests
  test('Sibnet', () async {
    final video = await Sibnet()
        .parse("https://video.sibnet.ru/shell.php?videoid=2235917");
    final videoUrl = video.url;
    expect(true, videoUrl.startsWith("https://video.sibnet.ru/v/"));
  });
  test('Kodik', () async {
    final video = await Kodik().parse(
        "https://kodik.info/seria/1227537/6e9b9400a1888d46c13dfeb29316648f/720p");
    final videoUrl = video!["360"]?.url;
    expect(true,
        videoUrl!.startsWith("https://cloud.kodik-storage.com/useruploads/"));
  });
  test('csst', () async {
    final video = await CSST().parse("https://csst.online/embed/683401/");
    final videoUrl = video!["360"]?.url;
    expect(true, videoUrl!.startsWith("https://www.secvideo1.online/get_file"));
  });
  // todo sovetromantica https://sovetromantica.com/embed/episode_1459_1-subtitles
  // https://scu2.sovetromantica.com/anime/1459_sousou-no-frieren/episodes/subtitles/episode_1/episode_1.m3u8
  

}
