import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pom_pom/l10n/app_localizations.dart';

part 'pomodoro.freezed.dart';
part 'pomodoro.g.dart';

enum PomodoroState {
  focus,
  shortBreak,
  longBreak;

  const PomodoroState();

  String name(BuildContext context) => switch (this) {
    PomodoroState.focus => AppLocalizations.of(context)!.focus,
    PomodoroState.shortBreak => AppLocalizations.of(context)!.shortBreak,
    PomodoroState.longBreak => AppLocalizations.of(context)!.longBreak,
  };

  String startMessage(BuildContext context) => switch (this) {
    PomodoroState.focus => AppLocalizations.of(context)!.focusMessage,
    PomodoroState.shortBreak => AppLocalizations.of(context)!.shortBreakMessage,
    PomodoroState.longBreak => AppLocalizations.of(context)!.longBreakMessage,
  };

  String endMessage(BuildContext context) =>
      AppLocalizations.of(context)!.completeMessage(name(context));
}

@freezed
class Pomodoro with _$Pomodoro {
  static const minValueMins = 1.0;
  static const maxValueMins = 60.0;

  const Pomodoro._();

  factory Pomodoro({
    @Default(PomodoroState.focus) PomodoroState pomodoroState,

    ///focus time in seconds
    @JsonKey(fromJson: _fromJsonTime) @Default(25 * 60) int focus,

    ///shortBreak time in seconds
    @JsonKey(fromJson: _fromJsonTime) @Default(5 * 60) int shortBreak,

    ///longBreak time in seconds
    @JsonKey(fromJson: _fromJsonTime) @Default(15 * 60) int longBreak,
    @JsonKey(fromJson: _fromJsonRounds) @Default(4) int rounds,
  }) = _Pomodoro;

  factory Pomodoro.fromJson(Map<String, dynamic> json) =>
      _$PomodoroFromJson(json);
}

int _fromJsonTime(int seconds) =>
    seconds >= (Pomodoro.minValueMins * 60) &&
            seconds <= (Pomodoro.maxValueMins * 60)
        ? seconds
        : 60;

int _fromJsonRounds(int rounds) =>
    rounds >= Pomodoro.minValueMins && rounds <= Pomodoro.maxValueMins
        ? rounds
        : 1;
