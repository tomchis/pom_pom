import 'dart:async';

import 'package:pom_pom/models/pomodoro.dart';
import 'package:pom_pom/models/pomodoro_notifier_state.dart';
import 'package:pom_pom/providers/settings_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timer_provider.g.dart';

@Riverpod(keepAlive: true)
class PomodoroNotifier extends _$PomodoroNotifier {
  Timer? _timer;
  static const _tickDuration = Duration(seconds: 1);

  @override
  PomodoroNotifierState build() {
    final pomodoro = ref.read(savedPomodoroProvider);
    return PomodoroNotifierState(initial: pomodoro, current: pomodoro);
  }

  void start() {
    if (_timer != null) {
      return;
    }

    state = state.copyWith(timerState: TimerState.running);
    _timer = Timer.periodic(_tickDuration, (timer) => tick());
  }

  void pause() {
    _timer?.cancel();
    _timer = null;

    state = state.copyWith(timerState: TimerState.paused);
  }

  void reset() {
    _timer?.cancel();
    _timer = null;

    state = build();
  }

  void skipRound() {
    switch (state.current.pomodoroState) {
      case PomodoroState.focus:
        if (state.current.rounds == 1) {
          state = state.copyWith(
            current: state.current.copyWith(
              focus: 0,
              longBreak: state.initial.longBreak,
              pomodoroState: PomodoroState.longBreak,
            ),
          );
        } else {
          state = state.copyWith(
            current: state.current.copyWith(
              focus: 0,
              shortBreak: state.initial.shortBreak,
              pomodoroState: PomodoroState.shortBreak,
            ),
          );
        }
        break;
      case PomodoroState.shortBreak:
        state = state.copyWith(
          current: state.current.copyWith(
            shortBreak: 0,
            focus: state.initial.focus,
            pomodoroState: PomodoroState.focus,
            rounds: state.current.rounds - 1,
          ),
        );
        break;
      case PomodoroState.longBreak:
        reset();
        break;
    }
  }

  void restartRound() {
    switch (state.current.pomodoroState) {
      case PomodoroState.focus:
        state = state.copyWith(
          current: state.current.copyWith(focus: state.initial.focus),
        );
        break;
      case PomodoroState.shortBreak:
        state = state.copyWith(
          current: state.current.copyWith(shortBreak: state.initial.shortBreak),
        );
        break;
      case PomodoroState.longBreak:
        state = state.copyWith(
          current: state.current.copyWith(longBreak: state.initial.longBreak),
        );
        break;
    }
  }

  void tick() {
    var newState = state.current;

    switch (newState.pomodoroState) {
      case PomodoroState.focus:
        if (newState.focus - 1 == 0) {
          // Switch to short break or if last round switch
          // to long break
          if (newState.rounds == 1) {
            newState = newState.copyWith(
              focus: 0,
              pomodoroState: PomodoroState.longBreak,
              longBreak: state.initial.longBreak,
            );
          } else {
            newState = newState.copyWith(
              focus: 0,
              pomodoroState: PomodoroState.shortBreak,
              shortBreak: state.initial.shortBreak,
            );
          }
        } else {
          newState = newState.copyWith(focus: newState.focus - 1);
        }
        break;
      case PomodoroState.shortBreak:
        if (newState.shortBreak - 1 == 0) {
          newState = newState.copyWith(
            shortBreak: 0,
            focus: state.initial.focus,
            pomodoroState: PomodoroState.focus,
            rounds: newState.rounds - 1,
          );
        } else {
          newState = newState.copyWith(shortBreak: newState.shortBreak - 1);
        }
        break;
      case PomodoroState.longBreak:
        if (newState.longBreak - 1 == 0) {
          reset();
          return;
        } else {
          newState = newState.copyWith(longBreak: newState.longBreak - 1);
        }
        break;
    }

    state = state.copyWith(current: newState);
  }
}
