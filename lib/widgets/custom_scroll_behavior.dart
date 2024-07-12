import 'package:flutter/material.dart';

class CustomScrollBehavior extends StatelessWidget {
  final Widget child;

  const CustomScrollBehavior({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoSplashScrollBehavior(),
      child: child,
    );
  }
}

class NoSplashScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const ClampingScrollPhysics();
  }

  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
