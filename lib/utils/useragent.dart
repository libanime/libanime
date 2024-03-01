import '../libanime.dart';
import 'package:faker/faker.dart';

var faker = Faker();

Map<String, dynamic> libUserAgent() {
  return {
    "User-Agent": "libanime/$libVer"
  };
}

Map<String, dynamic> randomUserAgent() {
  return {
    "User-Agent": faker.internet.userAgent(osName: 'Android')
  };
}
