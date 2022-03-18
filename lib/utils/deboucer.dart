import 'dart:async';

class Debouncer {
  Debouncer(this.milliseconds);

  final int milliseconds;
  Timer? _timer;

  run(void Function() action) {
    cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  cancel() {
    if (_timer != null) {
      _timer?.cancel();
    }
  }
}
