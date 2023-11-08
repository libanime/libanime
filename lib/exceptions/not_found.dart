class NotFoundException implements Exception {
  late String _message;

  NotFoundException([String message = 'Invalid value']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}
