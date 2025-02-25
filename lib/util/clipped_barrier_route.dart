import 'package:flutter/material.dart';
import 'package:pom_pom/util/styles.dart';

class ClippedBarrierRoute extends ModalBottomSheetRoute {
  ClippedBarrierRoute({
    required super.builder,
    required super.isScrollControlled,
    super.enableDrag,
    super.scrollControlDisabledMaxHeightRatio,
    super.constraints,
    super.shape,
  });

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return _ClippedPadded(
      child: super.buildPage(context, animation, secondaryAnimation),
    );
  }

  @override
  Widget buildModalBarrier() {
    if (barrierColor.a != 0 && !offstage) {
      final Animation<Color?> color = animation!.drive(
        ColorTween(
          begin: barrierColor.withValues(alpha: 0.0),
          end: barrierColor,
        ).chain(CurveTween(curve: barrierCurve)),
      );
      return _ClippedPadded(
        padTop: true,
        child: AnimatedModalBarrier(
          color: color,
          dismissible: barrierDismissible,
          semanticsLabel: barrierLabel,
          barrierSemanticsDismissible: semanticsDismissible,
          semanticsOnTapHint: barrierOnTapHint,
        ),
      );
    } else {
      return _ClippedPadded(
        padTop: true,
        child: ModalBarrier(
          dismissible: barrierDismissible,
          semanticsLabel: barrierLabel,
          barrierSemanticsDismissible: semanticsDismissible,
          semanticsOnTapHint: barrierOnTapHint,
        ),
      );
    }
  }
}

class _ClippedPadded extends StatelessWidget {
  const _ClippedPadded({required this.child, this.padTop = false});
  final Widget child;
  final bool padTop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: padTop ? Style.windowBorderWidth : 0,
        left: Style.windowBorderWidth,
        right: Style.windowBorderWidth,
        bottom: Style.windowBorderWidth,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Style.clipRadius),
        child: child,
      ),
    );
  }
}
