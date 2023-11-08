/*
  MetaVideo class contains direct link and information like type, quality
 */

class Video {
  int quality;
  String type;
  String url;
  Map<String, String>? headers;

  Video(this.quality, this.type, this.url, this.headers);
}
