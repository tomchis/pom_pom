import 'dart:io';

abstract class Util {
  static bool get isTest => Platform.environment.containsKey('FLUTTER_TEST');
}
