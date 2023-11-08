import '../../../structures/service.dart';
import '../../../structures/video.dart';
import '../../../structures/media_type.dart';
import '../../../structures/languages.dart';
import 'package:dio/dio.dart';
import '../../detect.dart';
import '../../../exceptions/bad_data.dart';

// preparings
class SovetRomantica {
  final regex = r'https?:\/\/(www\.)?[a-z1-9]{1,6}\.sovetromantica\.com\/(?:anime|dorama)\/.*\.m3u8"';
  final dio = Dio();

  Service getService() {
    return Service("sovetromantica", Language.ru, true, MediaType.anime);
  }

  Future<Video> parse(String link) async {
    if (Detect().validate(link, "sibnet")) {
      try {
        final response = await dio.get(link);
        final url =
            "https://video.sibnet.ru";
        return Video(480, "mp4", url, {"Referer": url});
      } on DioException {
        throw Exception("An error has occurred");
      }
    } else {
      throw BadDataException("Bad url!");
    }
  }
}