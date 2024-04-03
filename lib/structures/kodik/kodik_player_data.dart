class KodikData {
  KodikData();
  Map<String, dynamic> get(data) {
    //print(data);
    // ignore: unnecessary_string_escapes
    //const regex = r"var(?:\s*)urlParams(?:\s*)=(?:\s*)['\""](\{.*?\})['\"]\;?";
    //RegExpMatch? domain = RegExp(regex).firstMatch(data);
    String? type = RegExp(r"videoInfo.type = '(.*?)';").firstMatch(data)![1];
    String? hash = RegExp(r"videoInfo.hash = '(.*?)';").firstMatch(data)![1];
    String? id = RegExp(r"videoInfo.id = '(.*?)';").firstMatch(data)![1];

    return {
      //"domain": domain,
      "type": type,
      "hash": hash,
      "id": id,
      "bad_user": "True",
      "info": "{}",
      "cdn_is_working": "True"
    };
  }
}
