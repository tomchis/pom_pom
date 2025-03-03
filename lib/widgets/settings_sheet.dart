import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pom_pom/l10n/app_localizations.dart';
import 'package:pom_pom/models/pomodoro.dart';
import 'package:pom_pom/providers/settings_provider.dart';
import 'package:pom_pom/util/util.dart';
import 'package:url_launcher/url_launcher_string.dart';

const _sectionPaddingTop = 12.0;
const _labelPaddingLeft = 15.0;
const _labelPaddingTop = 4.0;
final _supportUrl = 'https://www.github.com/tomchis/pom_pom';
final _donateUrl = 'https://www.ko-fi.com/I3I71BCGSU';

class SettingsSheet extends ConsumerStatefulWidget {
  const SettingsSheet({super.key});

  @override
  ConsumerState<SettingsSheet> createState() => _SettingsSheetState();
}

class _SettingsSheetState extends ConsumerState<SettingsSheet>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: 2,
    vsync: this,
  );

  static const _tabHeight = 40.0;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Column(
              children: [
                TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(text: localizations.pomodoro, height: _tabHeight),
                    Tab(text: localizations.other, height: _tabHeight),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: const [_SettingsPomodoro(), _SettingsOther()],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed:
                    () =>
                        ref
                            .read(settingsNotifierProvider.notifier)
                            .clearSaved(),
                child: Text(
                  localizations.reset,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary.withAlpha(200),
                  ),
                ),
              ),
              TextButton(
                // style: FilledButton.styleFrom(
                //     padding: const EdgeInsets.symmetric(horizontal: 10.0)),
                onPressed: () => Navigator.of(context).pop(),
                child: Text(localizations.dismiss),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SettingsPomodoro extends ConsumerWidget {
  const _SettingsPomodoro();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final savedPomodoro = ref.watch(savedPomodoroProvider);
    final focusMins = savedPomodoro.focus ~/ 60;
    final shortBreakMins = savedPomodoro.shortBreak ~/ 60;
    final longBreakMins = savedPomodoro.longBreak ~/ 60;

    return Padding(
      padding: const EdgeInsets.only(top: _sectionPaddingTop),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: _labelPaddingTop,
        children: [
          _SliderItem(
            heading: localizations.focusNum(focusMins),
            value: focusMins.toDouble(),
            onChanged: (c) {
              ref.read(settingsNotifierProvider.notifier).focus =
                  c.toInt() * 60;
            },
          ),
          _SliderItem(
            heading: localizations.shortBreakNum(shortBreakMins),
            value: shortBreakMins.toDouble(),
            onChanged: (c) {
              ref.read(settingsNotifierProvider.notifier).shortBreak =
                  c.toInt() * 60;
            },
          ),
          _SliderItem(
            heading: localizations.longBreakNum(longBreakMins),
            value: longBreakMins.toDouble(),
            onChanged: (c) {
              ref.read(settingsNotifierProvider.notifier).longBreak =
                  c.toInt() * 60;
            },
          ),
          _SliderItem(
            heading: localizations.roundsNum(savedPomodoro.rounds),
            value: savedPomodoro.rounds.toDouble(),
            onChanged: (c) {
              ref.read(settingsNotifierProvider.notifier).rounds = c.toInt();
            },
          ),
        ],
      ),
    );
  }
}

class _SettingsOther extends ConsumerWidget {
  const _SettingsOther();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final volume =
        (ref.watch(settingsNotifierProvider.select((value) => value.volume)) ??
            1.0) *
        100;
    final alwaysOnTop =
        ref.watch(
          settingsNotifierProvider.select((value) => value.alwaysOnTop),
        ) ??
        false;

    return Padding(
      padding: const EdgeInsets.only(top: _sectionPaddingTop),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SliderItem(
            heading: localizations.notificationVolume(volume.toInt()),
            value: volume,
            minValue: 0,
            maxValue: 100,
            onChanged: (c) {
              final v = double.parse((c / 100).toStringAsFixed(2));
              ref.read(settingsNotifierProvider.notifier).volume = v;
            },
          ),
          if (!Util.isWayland)
            _SettingsItem(
              child: Row(
                children: [
                  Text(localizations.alwaysOnTop),
                  const SizedBox(width: 5.0),
                  Checkbox(
                    value: alwaysOnTop,
                    onChanged: (value) {
                      if (value != null) {
                        ref
                            .read(settingsNotifierProvider.notifier)
                            .alwaysOnTop = value;
                      }
                    },
                  ),
                ],
              ),
            ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Tooltip(
                message: _supportUrl,
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(Colors.blue),
                  ),
                  onPressed: () => launchUrlString(_supportUrl),
                  child: Text('Support'),
                ),
              ),
              Tooltip(
                message: _donateUrl,
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(Colors.blue),
                  ),
                  onPressed: () => launchUrlString(_donateUrl),
                  child: Text('Donate'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  const _SettingsItem({this.padTop = true, required this.child});

  final bool padTop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: _labelPaddingLeft,
        top: padTop ? _labelPaddingTop : 0,
      ),
      child: child,
    );
  }
}

class _SliderItem extends StatelessWidget {
  const _SliderItem({
    required this.heading,
    this.minValue = Pomodoro.minValueMins,
    this.maxValue = Pomodoro.maxValueMins,
    required this.value,
    required this.onChanged,
  });

  final String heading;
  final double minValue;
  final double maxValue;
  final double value;
  final void Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SettingsItem(padTop: false, child: Text(heading)),
        Slider(
          min: minValue,
          max: maxValue,
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
