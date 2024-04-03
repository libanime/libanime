library networking;

import 'package:dio/dio.dart';
//import 'package:dio_http2_adapter/dio_http2_adapter.dart';

final dio = Dio();

/*void setProxy(String proxyUrl) {
  dio.httpClientAdapter = Http2Adapter(
    ConnectionManager(
      idleTimeout: const Duration(seconds: 10),
      onClientCreate: (_, config) => config.proxy = Uri.parse(proxyUrl),
    ),
  );
}*/

/*void disableProxy(String proxyUrl) {
  dio.httpClientAdapter = Http2Adapter(
    ConnectionManager(
      idleTimeout: const Duration(seconds: 10),
      onClientCreate: (_, config) => config.proxy = null,
    ),
  );
  ;
}*/
