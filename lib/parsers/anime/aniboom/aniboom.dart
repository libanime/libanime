import 'package:libanime/exceptions/bad_data.dart';
import '../../../structures/service.dart';
import '../../../structures/video.dart';
import '../../../structures/media_type.dart';
import '../../../structures/languages.dart';
import 'package:dio/dio.dart';
import '../../detect.dart';
import '../../../networking.dart' as networking;
import 'package:xpath_selector_html_parser/src/ext.dart';
import 'dart:convert';

class Aniboom {
  final _headers = {
    "Referer": "https://aniboom.one/",
    "Accept-Language": "ru-RU",
    "Origin": "https://aniboom.one",
    "User-Agent":
        "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36",
  };
  final _dio = networking.dio;

  Service getService() {
    return Service("aniboom", Language.ru, true, MediaType.anime);
  }

  Future? parse(String link, [bool extra = false]) async {
    if (Detect().validate(link, "aniboom")) {
      try {
        final response = await _dio.get(
          link,
          options: Options(
            headers: {
              "Referer": "https://animego.org/",
              "Accept-Language": "ru-RU",
              "Origin": "https://aniboom.one",
              "User-Agent":
                  "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36",
            },
          ),
        );
        final xpath = HtmlXPath.html(response.data.toString());
        final json = jsonDecode(
            xpath.query('//*[@id="video"]/@data-parameters').attrs[0]!);
        // эта хуйня возвращает целый комплект данных по плееру
        // если очень хочется включите extra
        final hls = jsonDecode(json["hls"]);
        if (!extra) {
          return Video(1080, "m3u8", hls["src"], _headers);
        } else {
          return json;
        }
      } on DioException {
        throw Exception("An error has occurred");
      }
    } else {
      throw BadDataException("Bad url!");
    }
  }
}
