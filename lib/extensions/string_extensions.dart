extension TimeStrings on int {
  String timeStringFromMillis() => (this ~/ 1000).timeStringFromSeconds();

  (int minutes, int seconds) timeFromSeconds() {
    var m = 0;
    var s = this;
    while (s >= 60) {
      m++;
      s -= 60;
    }
    return (m, s);
  }

  String timeStringFromSeconds() {
    if (this < 1) {
      return '00:00';
    }

    final (m, s) = timeFromSeconds();

    final mStr = '$m'.padLeft(2, '0');
    final sStr = '$s'.padLeft(2, '0');
    return '$mStr:$sStr';
  }
}
