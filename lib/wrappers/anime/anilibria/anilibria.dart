import 'package:dio/dio.dart';
import 'package:libanime/utils/useragent.dart';
import 'package:libanime/networking.dart' as networking;

/// Перечисление для типа описания.
enum DescriptionType {
  plain,
  html,
  markdown,
}

/// Перечисление для типа плейлиста.
enum PlaylistType {
  object,
  array,
}

class AnilibriaApi {
  static const String baseApiUrl = 'https://api.anilibria.tv/v3';
  static const String titleListPath = '/title/list';
  static const String titlePath = '/title';

  final _dio = networking.dio
    ..options.headers = libUserAgent()
    ..options.baseUrl = baseApiUrl;
  AnilibriaApi();

  /// [idList] - список идентификаторов тайтлов.
  /// [codeList] - список кодов тайтлов.
  /// [torrentIdList] - список идентификаторов торрентов.
  /// [filter] - список полей для фильтрации.
  /// [remove] - список полей для удаления.
  /// [include] - список полей для включения.
  /// [descriptionType] - тип описания.
  /// [playlistType] - тип плейлиста.
  /// [page] - номер страницы.
  /// [itemsPerPage] - количество элементов на странице.

  Future<Map<String, dynamic>> getTitleList({
    List<String>? idList,
    List<String>? codeList,
    List<String>? torrentIdList,
    List<String>? filter,
    List<String>? remove,
    List<String>? include,
    DescriptionType descriptionType = DescriptionType.plain,
    PlaylistType playlistType = PlaylistType.object,
    int page = 1,
    int itemsPerPage = 10,
  }) async {
    var queryParams = {
      if (idList != null) 'id_list': idList.join(','),
      if (codeList != null) 'code_list': codeList.join(','),
      if (torrentIdList != null) 'torrent_id_list': torrentIdList.join(','),
      if (filter != null) 'filter': filter.join(','),
      if (remove != null) 'remove': remove.join(','),
      if (include != null) 'include': include.join(','),
      'description_type': descriptionType.name,
      'playlist_type': playlistType.name,
      'page': page.toString(),
      'items_per_page': itemsPerPage.toString(),
    };

    try {
      final response = await _dio.get(
        '$baseApiUrl$titleListPath',
        queryParameters: queryParams,
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception('Failed to load title list: ${e.message}');
    }
  }

  /// [id] - идентификатор тайтла.
  /// [code] - код тайтла.
  /// [torrentId] - идентификатор торрента.
  /// [filter] - список полей для фильтрации.
  /// [remove] - список полей для удаления.
  /// [include] - список полей для включения.
  /// [descriptionType] - тип описания.
  /// [playlistType] - тип плейлиста.

  Future<Map<String, dynamic>> getTitle({
    int? id,
    String? code,
    int? torrentId,
    List<String>? filter,
    List<String>? remove,
    List<String>? include,
    DescriptionType descriptionType = DescriptionType.plain,
    PlaylistType playlistType = PlaylistType.object,
  }) async {
    var queryParams = {
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (torrentId != null) 'torrent_id': torrentId,
      if (filter != null) 'filter': filter.join(','),
      if (remove != null) 'remove': remove.join(','),
      if (include != null) 'include': include.join(','),
      'description_type': descriptionType.name,
      'playlist_type': playlistType.name,
    };

    try {
      final response = await _dio.get(
        '$baseApiUrl$titlePath',
        queryParameters: queryParams,
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception('Failed to get title: ${e.message}');
    }
  }
}
