class BadDataException implements Exception {
  late String _message;
  
    BadDataException([String message = 'Invalid value']) {
      this._message = message;
    }
  
    @override
    String toString() {
      return _message;
    }


}