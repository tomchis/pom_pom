import 'dart:io';

abstract class Util {
  static bool get isTest => Platform.environment.containsKey('FLUTTER_TEST');
  static bool get isWayland =>
      Platform.environment['XDG_SESSION_TYPE'] == 'wayland';
}
