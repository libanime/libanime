import 'package:libanime/exceptions/bad_data.dart';

import '../../../structures/service.dart';
import '../../../structures/video.dart';
import '../../../structures/media_type.dart';
import '../../../structures/languages.dart';
import 'package:dio/dio.dart';
import '../../detect.dart';
class Aniboom {
  final _regex = r'(?<url>\/v\/.*?\.mp4)';
  final _dio = Dio();

  Service getService() {
    return Service("aniboom", Language.ru, true, MediaType.anime);
  }

  Future<Video> parse(String link) async {
    if (Detect().validate(link, "sibnet")) {

    }
  }

}
