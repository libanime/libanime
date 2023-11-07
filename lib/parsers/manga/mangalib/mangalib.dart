import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart' as html;


// LIBme family has same structure
class Mangalib {
  final _dio = Dio()
    ..options.baseUrl = 'https://mangalib.me'
    ..interceptors.add(LogInterceptor())
    ..httpClientAdapter = Http2Adapter(
      ConnectionManager(idleTimeout: Duration(seconds: 10)),
    );

    Future<String> parse(String slug) async {
      
      final response = await _dio.get('/');
      final document = html.parse(response.data.toString());

      final anchors = document.querySelectorAll('title');
      return anchors[0].text;
      
    }
    Future<Map> getShortInfoBySlug(String slug) async {
      try {
        final response = await _dio.get('/manga-short-info?slug=$slug'); // 404 if bad slug todo to implement
        return response.data;
      } on DioException catch (e) {
        if (e.response!.statusCode == 400) {
          throw Exception("Bad slug! Media not found!");
        } else {
          throw Exception("An error has occurred");
        }
      }
      
    }
    Future<String> getChapters(String slug) async {
      try {
        final response = await _dio.get('/$slug');
        final document = html.parse(response.data.toString());

        final anchors = document.querySelectorAll('div.media-chapter');
        List res = [];
        for (final ch in anchors) {
          res.add(ch);
        }
        return response.data.toString();
      } on DioException catch (e) {
        if (e.response!.statusCode == 400) {
          throw Exception("Bad slug! Media not found!");
        } else {
          throw Exception("An error has occurred");
        }
      }
      
    }
    
}