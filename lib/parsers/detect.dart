import 'package:libanime/parsers/detect_classes.dart';

import 'detect_regex.dart';

class Detect {
  dynamic detect(String url) {
    for (var entry in regexes.entries) {
      if (RegExp(entry.value).hasMatch(url)) {
        return classes[entry.key];
      }
    }
  }

  bool validate(String link, String service) {
    return RegExp(regexes[service]).hasMatch(link);
  }
}
