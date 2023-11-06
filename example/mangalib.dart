import '../lib/libanime.dart';

void main() async {
  final mangalib = Mangalib();

  final res = await mangalib.getInfoBySlug("kimetsu-no-yaiba");
  print(res["rus_name"]);

}