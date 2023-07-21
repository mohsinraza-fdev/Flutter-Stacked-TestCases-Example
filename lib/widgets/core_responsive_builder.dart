import 'package:flutter/material.dart';

class CoreResponsiveBuilder extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;
  const CoreResponsiveBuilder({
    super.key,
    this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    bool _isMobile = true;
    bool _isTablet = false;
    bool _isDesktop = true;

    if (_isMobile) {
      return mobile ?? const SizedBox.shrink();
    }
    if (_isTablet) {
      return tablet ?? const SizedBox.shrink();
    }
    if (_isDesktop) {
      return desktop ?? const SizedBox.shrink();
    }
    return SizedBox.shrink();
  }
}
