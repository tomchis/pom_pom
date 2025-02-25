import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pom_pom/extensions/string_extensions.dart';
import 'package:pom_pom/models/pomodoro.dart';

part 'pomodoro_notifier_state.freezed.dart';

enum TimerState { running, paused, stopped }

@freezed
class PomodoroNotifierState with _$PomodoroNotifierState {
  const PomodoroNotifierState._();

  factory PomodoroNotifierState({
    required Pomodoro initial,
    required Pomodoro current,
    @Default(TimerState.stopped) TimerState timerState,
  }) = _PomodoroNotifierState;

  String roundsString() {
    return '${(initial.rounds - current.rounds) + 1}/${initial.rounds}';
  }

  String currentTimeString() {
    final seconds = switch (current.pomodoroState) {
      PomodoroState.focus => current.focus,
      PomodoroState.shortBreak => current.shortBreak,
      PomodoroState.longBreak => current.longBreak,
    };
    return seconds.timeStringFromSeconds();
  }

  double percentCompleteOfPomodoroState() {
    int initialTotalSeconds;
    int currentTotalSeconds;

    switch (current.pomodoroState) {
      case PomodoroState.focus:
        initialTotalSeconds = initial.focus;
        currentTotalSeconds = current.focus;
        break;
      case PomodoroState.shortBreak:
        initialTotalSeconds = initial.shortBreak;
        currentTotalSeconds = current.shortBreak;
        break;
      case PomodoroState.longBreak:
        initialTotalSeconds = initial.longBreak;
        currentTotalSeconds = current.longBreak;
        break;
    }

    if (currentTotalSeconds >= initialTotalSeconds) {
      return 1.0;
    }

    return currentTotalSeconds / initialTotalSeconds;
  }
}
