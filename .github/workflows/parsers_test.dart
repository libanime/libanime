name: test-parsers
on: [push, workflow_dispatch]
jobs:
  drive:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - uses: subosito/flutter-action@v1
    - run: dart run test/libanime_test.dart
