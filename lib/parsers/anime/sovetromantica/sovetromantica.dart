import '../../../structures/service.dart';
import '../../../structures/video.dart';
import '../../../structures/media_type.dart';
import '../../../structures/languages.dart';
import 'package:dio/dio.dart';
import '../../detect.dart';
import '../../../exceptions/bad_data.dart';

class SovetRomantica {
  final _regex =
      r'https?:\/\/(www\.)?[a-z1-9]{1,6}\.sovetromantica\.com\/(?:anime|dorama)\/.*\.m3u8"';
  final _dio = Dio();

  Service getService() {
    return Service("sovetromantica", Language.ru, true, MediaType.anime);
  }

  Future<Video> parse(String link) async {
    if (Detect().validate(link, "sovetromantica")) {
      try {
        final response = await _dio.get(link);
        final url = _parseRes(response.data);
        return Video(1080, "m3u8", url!, null);
      } on DioException {
        throw Exception("An error has occurred");
      }
    } else {
      throw BadDataException("Bad url!");
    }
  }

  String? _parseRes(String res) {
    return RegExp(_regex).firstMatch(res)![0]!.replaceFirst('"', "");
  }
}
