import 'package:libanime/libanime.dart';

/// Kodik Examples
void main(List<String> args) async {
  final kodik = Kodik("YOUR_TOKEN_HERE");
  // Player Link parsing example
  var link = await kodik.parse(
      "https://kodik.info/seria/1133512/04d5f7824ba3563bd78e44a22451bb45/720p");
  // returns Map<String, Video>
  // for Video see https://github.com/libanime/libanime/blob/main/lib/structures/video.dart
  print(link!["360"]?.url);

  // Get Casts with episodes from MAL id(also Shikimori id) [TOKEN REQUIRED]
  var casts = await kodik.fetchCasts(
    "32");
  print(casts);

  // Get mappings from link [TOKEN REQUIRED]
  var mappings = await kodik.mappingsFromLink(
      "https://kodik.info/seria/1133512/04d5f7824ba3563bd78e44a22451bb45/720p");
  print(mappings);
}
