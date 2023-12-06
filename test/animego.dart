/*import 'dart:convert';

import '../lib/parsers/anime/websites/animego.dart';
import 'package:dio/dio.dart';


void main() async {
  Map<String, String> headers = {
    "User-Agent":
        "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Mobile Safari/537.36",
    "x-requested-with": "XMLHttpRequest",
  };
  final client = Dio(BaseOptions(
    headers: headers
  ));
    Response resp = await client.get("https://animego.org");
    var ongs = Ongoing(resp.toString()).parse().view();
    print("ONGOINGS");
    for (var i in ongs){
      print(i);
    }
    print("");
    var ongUrl = ongs[0]['url'].toString();
    
    resp = await client.get(ongUrl);
    var anime = Anime(resp.toString()).parse().view()[0];
    print("ANIME");
    print(anime);
    print("");
    var anId = anime['id'].toString();
    // var anId = 2421;
    resp = await client.get('https://animego.org/anime/$anId/player?_allow=true');
    print("");
    var resp2 = jsonDecode(resp.toString())['content'].toString();

    var dubView = DubbersView(resp2).parse().view();
    print("DUBBERS");
    for (var i in dubView){
      print(i);
    }
    print("");
    print("EPISODES");
    var episodes = Episode(resp2).parse().view();
    for (var i in episodes){
      print(i);
    }
    var epNum = episodes[0]['num'].toString();
    var epId = episodes[0]['id'].toString();
    print("");
    print("SOURCES");
    resp = await client.get('https://animego.org/anime/series?dubbing=2&provider=24&episode=$epNum&id=$epId');
    var resp3 = jsonDecode(resp.toString())['content'].toString();
    var sources = Source(resp3).parse().view();
    for (var i in sources){
      print(i);
    }
    client.close();
}*/
