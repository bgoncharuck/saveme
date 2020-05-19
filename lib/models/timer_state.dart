import 'package:flutter/material.dart';

abstract class ITimerState {
  double minutes;
  double seconds;

  ITimerState.fromJSON(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}

class TimerState implements ITimerState {
  double minutes;
  double seconds;

  TimerState({@required this.minutes, @required this.seconds});

  TimerState.fromJSON(Map<String, dynamic> json)
      : minutes = json['minutes'],
        seconds = json['seconds'];

  @override
  Map<String, dynamic> toJson() => {
        'minutes': minutes,
        'seconds': seconds,
      };
}
