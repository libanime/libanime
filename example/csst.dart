import 'package:libanime/libanime.dart';

/// CSST Examples
void main(List<String> args) async {
  final csst = CSST();

  print(await csst.parse("https://csst.online/embed/683401/"));
}
