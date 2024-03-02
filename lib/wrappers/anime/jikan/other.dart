import 'package:dio/dio.dart';
import 'package:libanime/exceptions/bad_response.dart';
import 'package:libanime/exceptions/not_found.dart';
import '../../../utils/useragent.dart';
import '../../../networking.dart' as networking;

// Services like characters, schedules
class JikanOther {
  static const _mainUrl = 'https://api.jikan.moe/v4/';
  final _dio = networking.dio
    ..options.headers = libUserAgent()
    ..options.baseUrl = _mainUrl;
  JikanOther();

  Future<Map<String, dynamic>> character(int id) async {
  // https://api.jikan.moe/v4/characters/32/full
    try {
      final res = await _dio.get("characters/$id/full");
      return res.data["data"];
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
          throw NotFoundException();
        
      } else {
          throw BadResponseException();
      }
    }
  }

  Future<Map<String, dynamic>> schedule([String? filter, bool? sfw = true, int? page = 1, int? limit = 10]) async {
  // https://api.jikan.moe/v4/schedules
    try {
      final res = await _dio.get("schedules?filter=$filter&sfw=$sfw&page=$page&limit=$limit");
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