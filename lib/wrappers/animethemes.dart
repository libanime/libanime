import 'package:dio/dio.dart';
import 'package:libanime/exceptions/bad_response.dart';
import 'package:libanime/exceptions/not_found.dart';
import '../../../utils/useragent.dart';
import '../../../networking.dart' as networking;

// Services like characters, schedules
class AnimeThemes {
  static const _mainUrl = 'https://api.animethemes.moe';
  final _dio = networking.dio
    ..options.headers = libUserAgent()
    ..options.baseUrl = _mainUrl;
  AnimeThemes();

  Future<Map<String, dynamic>?> titleThemes(int id) async {
    // nyan
    try {
      final res = await _dio.get(
          "/anime?filter[has]=resources&filter[site]=MyAnimeList&filter[external_id]=$id&include=animethemes.animethemeentries.videos,animethemes.song.artists,studios,animethemes.animethemeentries.videos.audio");
      List animes = res.data["anime"];
      if (animes.length == 1) {
        return animes[0];
      } else {
        throw NotFoundException();
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
        throw NotFoundException();
      } else {
        throw BadResponseException();
      }
    }
  }
}
