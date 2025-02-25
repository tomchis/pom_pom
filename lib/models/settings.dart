import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';

@freezed
class Settings with _$Settings {
  factory Settings({
    int? lastFocus,
    int? lastShortBreak,
    int? lastLongBreak,
    int? lastRounds,
    double? volume,
    bool? alwaysOnTop,
  }) = _Settings;
}
