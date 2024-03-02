import 'package:dio/dio.dart';
import '../../../exceptions/bad_response.dart';
import 'dart:async';
import '../../../exceptions/not_found.dart';
import '../../../networking.dart' as networking;

class ShikimoriOAuth {
  String applicationName;
  String clientId;
  final _domain = "shikimori.one";
  String clientSecret;
  String redirectUrl;
  // ignore: prefer_typing_uninitialized_variables
  late final accessToken;
  // ignore: prefer_typing_uninitialized_variables
  late final refreshToken;
  static const _defaultScopes = ['user_rates', 'comments', 'topics'];

  ShikimoriOAuth(
      this.clientId, this.clientSecret, this.applicationName, this.redirectUrl);
  final _dio = networking.dio;

  String generateAuthLink([List scopes = _defaultScopes]) {
    return "https://$_domain/oauth/authorize?client_id=$clientId&redirect_uri=${Uri.encodeComponent(redirectUrl)}&response_type=code&scope=${scopes.join('+')}";
  }

  Future<Map<String, dynamic>?> getAccessToken(String code) async {
    // Map<String, String>?
    try {
      final requestData = {
        'grant_type': 'authorization_code',
        'client_id': clientId,
        'client_secret': clientSecret,
        'code': code,
        'redirect_uri': redirectUrl
      };
      final res = await _dio.post("https://$_domain/oauth/token",
          data: requestData,
          options: Options(headers: {'User-Agent': applicationName}));
      accessToken = res.data["access_token"];
      refreshToken = res.data["refresh_token"];
      return res.data;
    } on DioException catch (e) {
      //print(e.response!.data);
      if (e.response!.statusCode == 404) {
        throw NotFoundException();
      } else {
        throw BadResponseException();
      }
    }
  }

  Future<Map<String, dynamic>?>? whoami() async {
    try {
      final res = await _dio.get("https://$_domain/api/users/whoami",
          options: Options(headers: {
            'User-Agent': applicationName,
            'Authorization': "Bearer $accessToken"
          }));
      return res.data;
    } on DioException {
      //print(e.response!.data);
      throw BadResponseException();
    }
  }
}
