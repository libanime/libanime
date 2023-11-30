import '../lib/wrappers/anime/jikan/anime.dart';
import '../lib/utils/utils.dart';

final anime = JikanAnime(30);

void main() async {
  final obj = await anime.episode(3);
  print(prettyPrint(obj));
}