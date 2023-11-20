import '../../../exceptions/unauthorized.dart';
import './endpoints.dart';
import 'package:dio/dio.dart';


class Anime365 {
  String? accessToken;
  final _dio = Dio()
    ..options.baseUrl = mainUrl;
  Anime365([this.accessToken]);

  Future<bool> isSubscribed() async {
    final meInfo = await me();
    return meInfo["isPremium"];
  }

  Future<Map<String, dynamic>> me() async {
    if (accessToken == null) {
      throw Unauthorized("Token not set!");
    }
    try {
      final response = await _dio.get("me?access_token=$accessToken");
      if (response.data["data"]["isLogined"]) {
        return response.data["data"];
      } else {
        throw Unauthorized();
      }
    } on DioException {
        throw Exception("An error has occurred");
      }
  }
}
