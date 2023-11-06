class KodikData {
  KodikData();
  Map<String, dynamic> get(data) {
    String? domain = RegExp(r'var domain = "(.*?)";').firstMatch(data)![1];
    String? d_sign = RegExp(r'var d_sign = "(.*?)";').firstMatch(data)![1];
    String? pd = RegExp(r'var pd = "(.*?)";').firstMatch(data)![1];
    String? ref = RegExp(r'var ref = "(.*?)";').firstMatch(data)![1];
    String? type = RegExp(r"videoInfo.type = '(.*?)';").firstMatch(data)![1];
    String? hash = RegExp(r"videoInfo.hash = '(.*?)';").firstMatch(data)![1];
    String? id = RegExp(r"videoInfo.id = '(.*?)';").firstMatch(data)![1];
    final bad_user = "False";
    final info = {};
    return {
      "domain": domain,
      "d_sign": d_sign,
      "pd": pd,
      "ref": ref,
      "type": type,
      "hash": hash,
      "id": id,
      "bad_user": "True",
      "info": "{}"
    };
  }
}