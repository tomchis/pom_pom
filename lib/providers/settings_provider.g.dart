// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$preferencesHash() => r'773e727e4f836bfa477c5020ec62c69d9210fbb2';

/// See also [preferences].
@ProviderFor(preferences)
final preferencesProvider = Provider<SharedPreferences>.internal(
  preferences,
  name: r'preferencesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$preferencesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PreferencesRef = ProviderRef<SharedPreferences>;
String _$savedPomodoroHash() => r'8c88d19e9b68bc045eb3da7a45a68324489c9d9b';

/// See also [savedPomodoro].
@ProviderFor(savedPomodoro)
final savedPomodoroProvider = Provider<Pomodoro>.internal(
  savedPomodoro,
  name: r'savedPomodoroProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$savedPomodoroHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SavedPomodoroRef = ProviderRef<Pomodoro>;
String _$themeHash() => r'db0ab52c04c3de564511e21076e63effe5bd1bff';

/// See also [theme].
@ProviderFor(theme)
final themeProvider = AutoDisposeProvider<ThemeData>.internal(
  theme,
  name: r'themeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$themeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ThemeRef = AutoDisposeProviderRef<ThemeData>;
String _$settingsNotifierHash() => r'6a5c637ba0b5c9c831a6de904edcf6775d167030';

/// See also [SettingsNotifier].
@ProviderFor(SettingsNotifier)
final settingsNotifierProvider =
    NotifierProvider<SettingsNotifier, Settings>.internal(
      SettingsNotifier.new,
      name: r'settingsNotifierProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$settingsNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SettingsNotifier = Notifier<Settings>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
