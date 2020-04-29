abstract class ISaveMeTimer {
  num minutes;
  num seconds;
  num minute;
  num second;
  void stop();
}

class DefaultTimer implements ISaveMeTimer {
  num minutes;
  num seconds;
  num minute;
  num second;
  DefaultTimer(this.minutes, this.seconds) {
    stop();
  }
  @override
  void stop() {
    minute = minutes;
    second = seconds;
  }
}

ISaveMeTimer CallTimer = DefaultTimer(3, 30);
