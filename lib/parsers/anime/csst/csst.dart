import 'package:libanime/exceptions/bad_data.dart';

import '../../../structures/service.dart';
import '../../../structures/video.dart';
import 'package:dio/dio.dart';
import '../../detect.dart';
import '../../../structures/media_type.dart';
import '../../../structures/languages.dart';

class CSST {
  final regex = r"\[(?<quality>\d{3,4})p\](?<url>https?:\/\/(?:www\.)?.*?\.mp4)";
  final dio = Dio();

  Service getService() {
    return Service("csst/secvideo", Language.multi, true, MediaType.anime);
  }

  Future<Map<String, Video>>? parse(String link) async {
    if (Detect().validate(link, "csst")) {
      try {
        final response = await dio.get(link);
        final links = RegExp(regex).allMatches(response.data.toString());
        final nyaa = <String, Video>{};
        final existingLinks = <String>[];
        for (final Match m in links) {
            if (!existingLinks.contains(m[2]!)) {
            String quality = m[1]!;
            final entry = MapEntry(quality, Video(int.parse(quality), "mp4", m[2]!, null)); 
            nyaa.addEntries([entry]);
            existingLinks.add(m[2]!);
          }
        }
        return nyaa;

      } on DioException { 
        throw Exception("An error has occurred");
      }
    } else {
      throw BadDataException("Bad url!");
    }
  }
  
}