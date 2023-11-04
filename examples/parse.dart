import 'package:libanime/libanime.dart';
import 'package:libanime/parsers/kodik/kodik.dart';


// TODO
void main(List<String> args) async {
    var link = await Kodik().parse("https://kodik.info/seria/1133512/04d5f7824ba3563bd78e44a22451bb45/720p", true);

    print(link!["360"]?.url);
}


