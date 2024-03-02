import 'package:dio/dio.dart';
import 'package:libanime/exceptions/bad_response.dart';
import 'package:libanime/exceptions/not_found.dart';
import '../../../utils/useragent.dart';
import '../../../networking.dart' as networking;

class JikanManga {
  int? mangaId;
  static const _mainUrl = 'https://api.jikan.moe/v4/manga/';
  final _dio = networking.dio
    ..options.headers = libUserAgent()
    ..options.baseUrl = _mainUrl;
  JikanManga(this.mangaId);

  Future<Map<String, dynamic>> get() async {
    // https://api.jikan.moe/v4/manga/32/full
    try {
      final res = await _dio.get("$mangaId/full");
      return res.data["data"];
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
        throw NotFoundException();
      } else {
        throw BadResponseException();
      }
    }
  }

  Future<List<Map>> characters() async {
    // https://api.jikan.moe/v4/manga/32/characters
    try {
      final res = await _dio.get("$mangaId/characters");
      return res.data["data"];
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
        throw NotFoundException();
      } else {
        throw BadResponseException();
      }
    }
  }

  Future<List<Map>> relations() async {
    // https://api.jikan.moe/v4/manga/32/relations
    try {
      final res = await _dio.get("$mangaId/relations");
      return res.data["data"];
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
        throw NotFoundException();
      } else {
        throw BadResponseException();
      }
    }
  }
}
