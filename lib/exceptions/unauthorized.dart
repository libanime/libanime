class Unauthorized implements Exception {
  late String _message;

  Unauthorized([String message = 'Try another token or creditinals']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}
