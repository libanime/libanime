import 'package:dio/dio.dart';
import 'package:libanime/exceptions/bad_data.dart';
import 'package:libanime/exceptions/bad_response.dart';
import 'package:libanime/exceptions/not_found.dart';


class Jikan {
  int? animeId;
  static const _mainUrl = 'https://api.jikan.moe/v4/';
  final _dio = Dio()
    ..options.baseUrl = _mainUrl;
  Jikan(this.animeId);
  // ToDo to implement search


  Future<Map<String, dynamic>> get() async {
  // https://api.jikan.moe/v4/anime/32/full
    try {
      final res = await _dio.get("anime/$animeId/full");
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
      final res = await _dio.get("anime/$animeId/characters");
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
      final res = await _dio.get("anime/$animeId/staff");
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
      final res = await _dio.get("anime/$animeId/relations");
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
      final res = await _dio.get("anime/$animeId/episodes/$episodeNum");
      return res.data["data"];
    } on DioException catch (e) {
      if (e.response!.statusCode == 500) {
        if (e.response!.data["type"] == "ParserException") {
          throw BadDataException("You're used episodes endpoint on movie.");
        } else {
          throw BadResponseException();
        }
      } else {
          throw BadResponseException();
      }
    }


  }
}