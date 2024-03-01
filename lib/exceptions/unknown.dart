class UnknownException implements Exception {
  late String _message;

  UnknownException([String message = 'An error has occurred']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}
