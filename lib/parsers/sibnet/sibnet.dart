import '../../structures/service.dart';
import '../../structures/video.dart';
import 'package:dio/dio.dart';
import '../detect.dart';

class Sibnet {
  final regex = r'(?<url>\/v\/.*?\.mp4)';
  final dio = Dio();

  Service getService() {
    return Service("sibnet", "ru", true, false);
  }
  Future<Video> parse(String link) async {
    if (Detect().validate(link, "sibnet")) {
      try {
        final response = await dio.get(link);
        final url = "https://video.sibnet.ru${parseRes(response.data.toString())!}";
        return Video(480, "mp4", url, {"Referer": url});

      } on DioException { 
        throw Exception("An error has occurred");
      }
    } else {
      throw Exception("Bad url!");
    }
  }

  String? parseRes(String res) {
    return RegExp(regex).firstMatch(res)![0];
  }
}