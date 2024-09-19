import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget desktopLayout;
  final Widget tabLayout;
  final Widget mobileLayout;

  const ResponsiveLayout({
    super.key,
    required this.desktopLayout,
    required this.tabLayout,
    required this.mobileLayout,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width <= 1200;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return desktopLayout;
        } else if (constraints.maxWidth > 800) {
          return tabLayout;
        }
        return mobileLayout;
      },
    );
  }
}
