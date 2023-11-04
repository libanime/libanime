/*
  MetaVideo class contains direct link and information like type, quality
 */
import 'dart:ffi';

class Video {
  int quality;
  String type;
  String url;
  List<Map<String, String>>? headers;
  
  Video(this.quality, this.type, this.url, this.headers);
}