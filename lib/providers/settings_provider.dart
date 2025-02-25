import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pom_pom/models/pomodoro.dart';
import 'package:pom_pom/models/settings.dart';
import 'package:pom_pom/providers/timer_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_provider.g.dart';

const _pomodorosKey = 'pomodoros';
const _volumeKey = 'volume';
const _alwaysOnTopKey = 'alwaysOnTop';

@Riverpod(keepAlive: true)
SharedPreferences preferences(Ref ref) {
  throw UnimplementedError();
}

@Riverpod(keepAlive: true)
Pomodoro savedPomodoro(Ref ref) {
  final defaultPomodoro = Pomodoro();
  return ref.watch(
    settingsNotifierProvider.select((value) {
      return Pomodoro(
        focus: value.lastFocus ?? defaultPomodoro.focus,
        shortBreak: value.lastShortBreak ?? defaultPomodoro.shortBreak,
        longBreak: value.lastLongBreak ?? defaultPomodoro.longBreak,
        rounds: value.lastRounds ?? defaultPomodoro.rounds,
      );
    }),
  );
}

@riverpod
ThemeData theme(Ref ref) {
  final pomodoroState = ref.watch(
    pomodoroNotifierProvider.select((value) => value.current.pomodoroState),
  );

  final seedColor =
      pomodoroState == PomodoroState.focus
          ? const Color.fromARGB(255, 114, 19, 12)
          : const Color.fromARGB(255, 17, 78, 19);

  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
    sliderTheme: const SliderThemeData(
      overlayShape: RoundSliderOverlayShape(overlayRadius: 16.0),
    ),
    tooltipTheme: const TooltipThemeData(
      waitDuration: Duration(milliseconds: 800),
    ),
  );
}

@Riverpod(keepAlive: true)
class SettingsNotifier extends _$SettingsNotifier {
  @override
  Settings build() {
    final prefs = ref.read(preferencesProvider);
    final arrayJson = prefs.getString(_pomodorosKey);
    Pomodoro? pomodoro;
    if (arrayJson != null) {
      final array = jsonDecode(arrayJson);
      pomodoro = Pomodoro.fromJson(array[0]);
    }
    return Settings(
      lastFocus: pomodoro?.focus,
      lastShortBreak: pomodoro?.shortBreak,
      lastLongBreak: pomodoro?.longBreak,
      lastRounds: pomodoro?.rounds,
      volume: prefs.getDouble(_volumeKey),
      alwaysOnTop: prefs.getBool(_alwaysOnTopKey),
    );
  }

  Future<void> save() async {
    final prefs = ref.read(preferencesProvider);

    if (state.lastFocus != null ||
        state.lastLongBreak != null ||
        state.lastShortBreak != null ||
        state.lastRounds != null) {
      var pomodoro = Pomodoro();
      pomodoro = pomodoro.copyWith(
        focus: state.lastFocus ?? pomodoro.focus,
        shortBreak: state.lastShortBreak ?? pomodoro.shortBreak,
        longBreak: state.lastLongBreak ?? pomodoro.longBreak,
        rounds: state.lastRounds ?? pomodoro.rounds,
      );

      // Save to json array for potential future profile support
      final array = [pomodoro.toJson()];
      prefs.setString(_pomodorosKey, jsonEncode(array));
    }

    if (state.volume != null) {
      prefs.setDouble(_volumeKey, state.volume!);
    }
    if (state.alwaysOnTop != null) {
      prefs.setBool(_alwaysOnTopKey, state.alwaysOnTop!);
    }
  }

  Future<void> clearSaved() async {
    final prefs = ref.read(preferencesProvider);
    await prefs.remove(_pomodorosKey);
    state = state.copyWith(
      lastFocus: null,
      lastShortBreak: null,
      lastLongBreak: null,
      lastRounds: null,
    );
  }

  set focus(int seconds) => state = state.copyWith(lastFocus: seconds);
  set shortBreak(int seconds) =>
      state = state.copyWith(lastShortBreak: seconds);
  set longBreak(int seconds) => state = state.copyWith(lastLongBreak: seconds);
  set rounds(int rounds) => state = state.copyWith(lastRounds: rounds);

  /// `volume` between 0.0 and 1.0
  set volume(double volume) => state = state.copyWith(volume: volume);
  set alwaysOnTop(bool alwaysOnTop) =>
      state = state.copyWith(alwaysOnTop: alwaysOnTop);
}
