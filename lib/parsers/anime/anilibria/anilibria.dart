import 'package:dio/dio.dart';
import '../../../structures/service.dart';
import '../../../structures/media_type.dart';
import '../../../structures/languages.dart';

class Anilibria {
  Anilibria();

  Service getService() {
    return Service("anilibria", Language.ru, true, MediaType.anime);
  }

  var _dio = Dio();

}