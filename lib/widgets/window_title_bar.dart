import 'dart:io';

import 'package:flutter/material.dart';

import 'package:yaru/yaru.dart';

class WindowTitleBar extends StatelessWidget {
  const WindowTitleBar({super.key});

  static final height = Platform.isLinux ? 35.0 : 30.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: height,
      child: YaruWindowTitleBar(
        title: const Text('PomPom'),
        buttonPadding: Platform.isWindows ? EdgeInsets.zero : null,
        buttonSpacing: Platform.isWindows ? 0.0 : null,
        foregroundColor: theme.colorScheme.primary,
        backgroundColor: theme.colorScheme.surface,
        border: BorderSide.none,
        isMaximizable: false,
      ),
    );
  }
}
