import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pom_pom/l10n/app_localizations.dart';
import 'package:pom_pom/providers/settings_provider.dart';
import 'package:pom_pom/util/styles.dart';
import 'package:pom_pom/util/util.dart';
import 'package:pom_pom/widgets/timer/timer.dart';
import 'package:pom_pom/widgets/window_title_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();
  if (!Platform.isWindows) {
    await FlutterLocalNotificationsPlugin().initialize(
      InitializationSettings(
        macOS: const DarwinInitializationSettings(
          requestBadgePermission: false,
          requestSoundPermission: false,
        ),
        linux: LinuxInitializationSettings(
          defaultIcon: AssetsLinuxIcon('assets/icon_small.png'),
          defaultActionName: '',
        ),
      ),
    );
  }

  const windowOptions = WindowOptions(
    minimumSize: Style.windowSize,
    maximumSize: Style.windowSize,
    skipTaskbar: false,
    backgroundColor: Colors.transparent,
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.setAsFrameless();
    await windowManager.show();
    await windowManager.focus();
  });

  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [preferencesProvider.overrideWith((ref) => prefs)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    ref.listenManual(
      settingsNotifierProvider.select((value) => value.alwaysOnTop),
      (previous, next) async {
        if (next != null) {
          await windowManager.setAlwaysOnTop(next);
        }
      },
      fireImmediately: true,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);

    final borderColor =
        theme.brightness == Brightness.dark
            ? Colors.white60
            : Colors.grey.shade500;

    final home = DecoratedBox(
      position: DecorationPosition.foreground,
      decoration: BoxDecoration(
        border: Border.all(width: Style.windowBorderWidth, color: borderColor),
        borderRadius: BorderRadius.circular(Style.clipRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Style.clipRadius),
        child: const Column(
          children: [
            WindowTitleBar(),
            Expanded(child: Scaffold(body: Timer())),
          ],
        ),
      ),
    );

    return MaterialApp(
      title: 'PomPom',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales:
          Util.isTest ? [Locale('en')] : AppLocalizations.supportedLocales,
      theme: theme,
      home: home,
    );
  }
}
