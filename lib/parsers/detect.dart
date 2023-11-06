import 'detect_regex.dart';

class Detect {
  

  String detect(String link) {
    return "type";
  }
  bool validate(String link, String service) {
    return RegExp(regexes[service]).hasMatch(link); 
  }
  
}