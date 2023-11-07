import './languages.dart';
import './media_type.dart';

class Service {
  final name;
  Language language;
  final isPlayer;
  MediaType mediaType;
  //List domains = []; need to be implemented


  Service(this.name, this.language, this.isPlayer, this.mediaType);
}