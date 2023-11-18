import 'package:libanime/exceptions/bad_data.dart';

import '../../../structures/service.dart';
import '../../../structures/video.dart';
import '../../../structures/media_type.dart';
import '../../../structures/languages.dart';
import 'package:dio/dio.dart';
import '../../detect.dart';

// Sibnet player parser
class Sibnet {
  final _regex = r'(?<url>\/v\/.*?\.mp4)';
  final _dio = Dio();

  Service getService() {
    return Service("sibnet", Language.ru, true, MediaType.anime);
  }

  Future<Video> parse(String link) async {
    if (Detect().validate(link, "sibnet")) {
      try {
        final response = await _dio.get(link);
        final url =
            "https://video.sibnet.ru${_parseRes(response.data.toString())!}";
        return Video(480, "mp4", url, {"Referer": url});
      } on DioException {
        throw Exception("An error has occurred");
      }
    } else {
      throw BadDataException("Bad url!");
    }
  }

  String? _parseRes(String res) {
    return RegExp(_regex).firstMatch(res)![0];
  }
}
