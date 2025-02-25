import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// ignore: depend_on_referenced_packages, implementation_imports
import 'package:flutter_local_notifications_linux/src/model/hint.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minisound/engine_flutter.dart';
import 'package:path/path.dart' as p;
import 'package:pom_pom/l10n/app_localizations.dart';
import 'package:pom_pom/models/pomodoro.dart';
import 'package:pom_pom/models/pomodoro_notifier_state.dart';
import 'package:pom_pom/providers/settings_provider.dart';
import 'package:pom_pom/providers/timer_provider.dart';
import 'package:pom_pom/util/clipped_barrier_route.dart';
import 'package:pom_pom/util/styles.dart';
import 'package:pom_pom/util/util.dart';
import 'package:pom_pom/widgets/settings_sheet.dart';
import 'package:pom_pom/widgets/timer/countdown_indicator.dart';
import 'package:pom_pom/widgets/window_title_bar.dart';
import 'package:windows_notification/notification_message.dart';
import 'package:windows_notification/windows_notification.dart';

class Timer extends ConsumerStatefulWidget {
  const Timer({super.key});

  @override
  ConsumerState<Timer> createState() => _TimerState();
}

class _TimerState extends ConsumerState<Timer> {
  Engine? _engine;
  Sound? _sound;

  @override
  void initState() {
    ref.listenManual(
      pomodoroNotifierProvider.select((value) => value.current.pomodoroState),
      (previous, next) async {
        if (Platform.isWindows) {
          await WindowsNotification(
            applicationId: 'pom_pom',
          ).clearNotificationHistory();
        } else {
          await FlutterLocalNotificationsPlugin().cancelAll();
        }
        if (previous != null &&
            ref.read(pomodoroNotifierProvider).timerState ==
                TimerState.running) {
          _showStateChangeNotification(previous, next);
        }
      },
    );

    _initSoundEngine().then((_) {
      ref.listenManual(
        settingsNotifierProvider.select((value) => value.volume),
        (previous, next) {
          if (next != null) {
            _sound?.volume = next;
          }
        },
        fireImmediately: true,
      );
    });

    super.initState();
  }

  Future<void> _initSoundEngine() async {
    if (Util.isTest) {
      return;
    }

    _engine = Engine();
    await _engine!.init();
    _sound = await _engine!.loadSoundAsset('assets/change.mp3');
    _sound!.volume = 1.0;
    await _engine!.start();
  }

  void _timerToggle(WidgetRef ref, TimerState timerState) {
    final notifier = ref.read(pomodoroNotifierProvider.notifier);
    switch (timerState) {
      case TimerState.running:
        notifier.pause();
        break;
      default:
        notifier.start();
    }
  }

  Future<void> _showStateChangeNotification(
    PomodoroState previous,
    PomodoroState next,
  ) async {
    _sound?.play();

    final title = previous.endMessage(context);
    final body =
        previous == PomodoroState.longBreak
            ? AppLocalizations.of(context)!.readyForNextMessage
            : next.startMessage(context);
    final imagePath = p.join(
      p.dirname(Platform.resolvedExecutable),
      'data/flutter_assets/assets/icon_small.png',
    );

    if (Platform.isWindows) {
      final windowsNotification = WindowsNotification(applicationId: 'pom_pom');
      final message = NotificationMessage.fromPluginTemplate(
        'com.tac.pompom',
        title,
        body,
        image: imagePath,
      );
      await windowsNotification.showNotificationPluginTemplate(message);
    } else {
      await FlutterLocalNotificationsPlugin().show(
        0,
        title,
        body,
        NotificationDetails(
          linux: LinuxNotificationDetails(
            customHints: [
              LinuxNotificationCustomHint(
                'image-path',
                LinuxHintStringValue(imagePath),
              ),
            ],
          ),
        ),
      );
    }
  }

  void _showSettings(BuildContext context) async {
    final route = ClippedBarrierRoute(
      enableDrag: false,
      scrollControlDisabledMaxHeightRatio: 1.0,
      constraints: BoxConstraints(
        maxHeight: Style.windowSize.height - (Style.windowBorderWidth * 2),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Style.clipRadius),
      ),
      builder: (context) => const SettingsSheet(),
      isScrollControlled: false,
    );

    await Navigator.of(context).push(route);

    ref.read(settingsNotifierProvider.notifier).save();
    if (ref.read(pomodoroNotifierProvider).timerState == TimerState.stopped) {
      ref.read(pomodoroNotifierProvider.notifier).reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(pomodoroNotifierProvider);
    final textTheme = Theme.of(context).textTheme;
    final localizations = AppLocalizations.of(context)!;
    final timerToggleText = switch (state.timerState) {
      TimerState.running => localizations.pause,
      TimerState.paused => localizations.resume,
      TimerState.stopped => localizations.start,
    };

    final face = Row(
      children: [
        IconButton(
          iconSize: 30.0,
          onPressed:
              state.timerState != TimerState.stopped
                  ? () =>
                      ref.read(pomodoroNotifierProvider.notifier).restartRound()
                  : null,
          tooltip: localizations.restartRound,
          icon: const Icon(Icons.skip_previous_rounded),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                state.currentTimeString(),
                style: textTheme.displayLarge!.copyWith(fontSize: 45),
              ),
              AutoSizeText(
                state.current.pomodoroState.name(context),
                style: textTheme.displaySmall!.copyWith(fontSize: 24),
                maxLines: 1,
              ),
              const SizedBox(height: 5),
              Text(state.roundsString(), style: textTheme.titleMedium),
              const SizedBox(height: 10),
              FilledButton(
                onPressed: () => _timerToggle(ref, state.timerState),
                child: Text(timerToggleText),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed:
                    state.timerState != TimerState.stopped
                        ? () =>
                            ref.read(pomodoroNotifierProvider.notifier).reset()
                        : null,
                child: Text(localizations.reset),
              ),
            ],
          ),
        ),
        IconButton(
          iconSize: 30.0,
          onPressed:
              state.timerState != TimerState.stopped
                  ? () =>
                      ref.read(pomodoroNotifierProvider.notifier).skipRound()
                  : null,
          tooltip: localizations.skipRound,
          icon: const Icon(Icons.skip_next_rounded),
        ),
      ],
    );

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 12.0,
            right: 12.0,
            bottom: WindowTitleBar.height / 2,
          ),
          child: CustomPaint(
            willChange: state.timerState == TimerState.running,
            painter: CountdownIndicator(
              percentComplete: state.percentCompleteOfPomodoroState(),
              activeColor: Theme.of(context).colorScheme.primary,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: face,
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: IconButton(
            onPressed: () => _showSettings(context),
            tooltip: localizations.settings,
            icon: const Icon(Icons.settings),
          ),
        ),
      ],
    );
  }
}
