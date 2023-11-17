import 'package:libanime/libanime.dart';

/// CSST Examples
void main(List<String> args) async {
  final csst = CSST();
  var link = await csst.parse("https://csst.online/embed/683401/");

  print(link!["360"]?.url);
}
