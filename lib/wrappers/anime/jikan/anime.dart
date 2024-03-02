import 'package:dio/dio.dart';
import 'package:libanime/exceptions/bad_data.dart';
import 'package:libanime/exceptions/bad_response.dart';
import 'package:libanime/exceptions/not_found.dart';
import '../../../utils/useragent.dart';
import '../../../networking.dart' as networking;

class JikanAnime {
  int? animeId;
  static const _mainUrl = 'https://api.jikan.moe/v4/anime/';
  final _dio = networking.dio
    ..options.headers = libUserAgent()
    ..options.baseUrl = _mainUrl;
  JikanAnime(this.animeId);
  // ToDo to implement search


  Future<Map<String, dynamic>> get() async {
  // https://api.jikan.moe/v4/anime/32/full
    try {
      final res = await _dio.get("$animeId/full");
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
    // https://api.jikan.moe/v4/anime/32/characters
    try {
      final res = await _dio.get("$animeId/characters");
      return res.data["data"];
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
          throw NotFoundException();
        
      } else {
          throw BadResponseException();
      }
    }
  }

  Future<List<Map>> staff() async {
    // https://api.jikan.moe/v4/anime/32/staff
    try {
      final res = await _dio.get("$animeId/staff");
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
    // https://api.jikan.moe/v4/anime/32/relations
    try {
      final res = await _dio.get("$animeId/relations");
      return res.data["data"];
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
          throw NotFoundException();
        
      } else {
          throw BadResponseException();
      }
    }
  }
  

  Future<Map<String, dynamic>> episode(int episodeNum) async {
    // https://api.jikan.moe/v4/anime/55644/episodes/1
    try {
      final res = await _dio.get("$animeId/episodes/$episodeNum");
      return res.data["data"];
    } on DioException catch (e) {
      if (e.response!.statusCode == 500) {
        if (e.response!.data["type"] == "ParserException") {
          throw BadDataException("You're used episodes endpoint not on serial.");
        } else {
          throw BadResponseException();
        }
      } else {
          throw BadResponseException();
      }
    }


  }
}