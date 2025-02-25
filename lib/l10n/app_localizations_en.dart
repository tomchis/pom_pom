// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get focus => 'Focus';

  @override
  String get shortBreak => 'Short break';

  @override
  String get longBreak => 'Long break';

  @override
  String get pause => 'Pause';

  @override
  String get resume => 'Resume';

  @override
  String get start => 'Start';

  @override
  String get reset => 'Reset';

  @override
  String get restartRound => 'Restart round';

  @override
  String get skipRound => 'Skip round';

  @override
  String get settings => 'Settings';

  @override
  String get focusMessage => 'Begin focusing';

  @override
  String get shortBreakMessage => 'Take a short break';

  @override
  String get longBreakMessage => 'Take a long break';

  @override
  String completeMessage(String state) {
    return '$state complete';
  }

  @override
  String get readyForNextMessage => 'Ready for next session';

  @override
  String get pomodoro => 'Pomodoro';

  @override
  String get other => 'Other';

  @override
  String get dismiss => 'Dismiss';

  @override
  String focusNum(Object value) {
    return 'Focus: $value';
  }

  @override
  String shortBreakNum(Object value) {
    return 'Short break: $value';
  }

  @override
  String longBreakNum(Object value) {
    return 'Long break: $value';
  }

  @override
  String roundsNum(Object value) {
    return 'Rounds: $value';
  }

  @override
  String notificationVolume(Object value) {
    return 'Notification volume: $value';
  }

  @override
  String get alwaysOnTop => 'Always on top:';
}
