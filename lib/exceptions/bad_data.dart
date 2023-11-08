class BadDataException implements Exception {
  late String _message;

  BadDataException([String message = 'Invalid value']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}
