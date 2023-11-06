import 'package:dio/dio.dart';

class AniSkip {
  Future<List<Object>>? getTimings(int malId, int episode, double episodeDuration) async {
    try {
      final response = await Dio().get("https://api.aniskip.com/v2/skip-times/$malId/$episode?types[]=ed&types[]=mixed-ed&types[]=mixed-op&types[]=op&types[]=recap&episodeLength=$episodeDuration");
      return response.data["results"];
    } on DioException catch (e) {
      if (!e.response!.data["found"]) {
        throw Exception("Not found. May be you're provided bad malId, episode or episodeDuration.");
      } else {
        throw Exception("An error has occurred");
      }
      
    }
    
    
    
  }
}