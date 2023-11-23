import 'package:dio/dio.dart';
import 'package:libanime/exceptions/bad_response.dart';
import 'package:libanime/exceptions/not_found.dart';

class AniSkip {
  Future<List<Object>>? getTimings(
      int malId, int episode, double episodeDuration) async {
    try {
      final response = await Dio().get(
          "https://api.aniskip.com/v2/skip-times/$malId/$episode?types[]=ed&types[]=mixed-ed&types[]=mixed-op&types[]=op&types[]=recap&episodeLength=$episodeDuration");
      return response.data["results"];
    } on DioException catch (e) {
      if (!e.response!.data["found"]) {
        throw NotFoundException(
            "Not found. May be you're provided bad malId, episode or episodeDuration.");
      } else {
        throw BadResponseException("An error has occurred");
      }
    }
  }
}
