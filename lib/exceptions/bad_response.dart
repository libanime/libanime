class BadResponseException implements Exception {
  late String _message;

  BadResponseException([String message = 'An error has occurred']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}