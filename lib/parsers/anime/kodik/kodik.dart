import 'package:dio/dio.dart';
import 'package:libanime/structures/video.dart';
import '../../detect.dart';
//import '../../enum/services.dart';
import '../../../structures/service.dart';
import '../../../structures/media_type.dart';
import '../../../structures/languages.dart';
import '../../../structures/kodik/kodik_player_data.dart';
import '../../../exceptions/bad_data.dart';
import 'dart:convert';

// Kodik player parser
class Kodik {
  String? tokenSaved;
  Kodik([this.tokenSaved]);

  Service getService() {
    return Service("kodik", Language.ru, true, MediaType.anime);
  }

  var dio = Dio();
  // Parse player url.
  // Returns Video object
  // ```dart
  // var link = await kodik.parse(
  //    "https://kodik.info/seria/1133512/04d5f7824ba3563bd78e44a22451bb45/720p");
  //```
  Future<Map<String, Video>>? parse(String link, [bool mp4 = false]) async {
    if (Detect().validate(link, "kodik")) {
      final data = await _parsePlayer(link);
      final domain = RegExp(
              r"(?:[a-z0-9](?:[a-z0-9-]{0,61}[a-z0-9])?\.)+[a-z0-9][a-z0-9-]{0,61}[a-z0-9]")
          .stringMatch(link);
      final res = await dio.post(
        "https://$domain/gvi",
        data: FormData.fromMap(data!),
        options: Options(headers: {
          "origin": "https://kodik.info",
          "accept": "application/json, text/javascript, */*; q=0.01",
          "referer": "https://$domain",
          "user-agent":
              "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36",
          'x-requested-with': 'XMLHttpRequest'
        }),
      );
      if (res.statusCode == 200) {
        final links = res.data["links"];
        if (!mp4) {
          return {
            "360": Video(360, "m3u8",
                "https:${_decodeUrl(links["360"][0]["src"])}", null),
            "480": Video(480, "m3u8",
                "https:${_decodeUrl(links["480"][0]["src"])}", null),
            "720": Video(720, "m3u8",
                "https:${_decodeUrl(links["720"][0]["src"])}", null)
          };
        } else {
          return {
            "360": Video(
                360,
                "mp4",
                "https:${_decodeUrl(links["360"][0]["src"]).replaceAll(":hls:manifest.m3u8", "")}",
                null),
            "480": Video(
                480,
                "mp4",
                "https:${_decodeUrl(links["480"][0]["src"]).replaceAll(":hls:manifest.m3u8", "")}",
                null),
            "720": Video(
                720,
                "mp4",
                "https:${_decodeUrl(links["720"][0]["src"]).replaceAll(":hls:manifest.m3u8", "")}",
                null)
          };
        }
      } else {
        throw Exception("Link decode error.");
      }
    } else {
      throw BadDataException("Bad url!");
    }
  }

  String _caesarCipherDecoder(String text) {
    int shift = 13;
    String decodedText = "";
    for (int i = 0; i < text.length; i++) {
      int charCode = text.codeUnitAt(i);
      if (charCode >= 65 && charCode <= 90) {
        decodedText += String.fromCharCode((charCode - shift - 65) % 26 + 65);
      } else if (charCode >= 97 && charCode <= 122) {
        decodedText += String.fromCharCode((charCode - shift - 97) % 26 + 97);
      } else {
        decodedText += String.fromCharCode(charCode);
      }
    }
    return decodedText;
  }

  String _decodeUrl(String urlEncoded) {
    return utf8.decode(base64.decode(_caesarCipherDecoder(urlEncoded)));
  }

  Future<Map<String, dynamic>>? _parsePlayer(String link) async {
    final response = await dio.get(link);
    if (response.statusCode == 200) {
      final data = KodikData().get(response.data);
      return data;
    } else {
      throw Exception("An error has occurred");
    }
  }

  // Search IDs via Kodik API by player_link field
  // Token required! So.. you can find it on the internet or mail them with request for access.
  Future<Object>? mappingsFromLink(String link) async {
    if (tokenSaved == null) {
      throw Exception("Token not set!");
    } else {
      try {
        final response = await dio.get(
            'https://kodikapi.com/search?token=$tokenSaved&player_link=$link');

        var data = response.data["results"][0];
        return {
          "kinopoisk":
              data["kinopoisk_id"] ? data["kinopoisk_id"].toInt() : null,
          "imdb": data["imdb_id"],
          "worldart": data["worldart_link"],
          "shikimori":
              data["shikimori_id"] ? data["shikimori_id"].toInt() : null
        };
      } on DioException catch (e) {
        if (e.response!.statusCode == 500) {
          throw BadDataException("Bad Token or Player URL!");
        } else {
          throw Exception("An error has occurred");
        }
      }
    }
  }
}
