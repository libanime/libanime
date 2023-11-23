class NotFoundException implements Exception {
  late String _message;

  NotFoundException([String message = 'Not found']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}
