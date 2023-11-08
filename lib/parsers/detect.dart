import 'detect_regex.dart';

class Detect {
  bool validate(String link, String service) {
    return RegExp(regexes[service]).hasMatch(link);
  }
}
