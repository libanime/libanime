import './languages.dart';
import './media_type.dart';

class Service {
  String name;
  Language language;
  bool isPlayer;
  MediaType mediaType;
  //List domains = []; need to be implemented

  Service(this.name, this.language, this.isPlayer, this.mediaType);
}
