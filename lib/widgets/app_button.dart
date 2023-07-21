import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_stacked_testcases_example/constants/app_dimens.dart';
import 'package:flutter_stacked_testcases_example/shared/app_text_styles.dart';
import 'package:flutter_stacked_testcases_example/shared/app_theme.dart';

class AppButton extends StatefulWidget {
  final AppButtonType type;
  final AppButtonSize size;
  final double? width;
  final double? height;
  final double? horizontalMargin;
  final bool fitToText;
  final bool isDisabled;
  final VoidCallback? onTap;
  final String? label;
  final TextStyle? labelStyle;
  final String? leadingIcon;
  final Color? leadingIconColor;
  final String? trailingIcon;
  final Color? trailingIconColor;
  final bool isLoading;

  const AppButton._({
    super.key,
    required this.type,
    required this.size,
    this.width,
    this.height,
    this.horizontalMargin,
    this.fitToText = false,
    this.isDisabled = false,
    this.onTap,
    this.label,
    this.labelStyle,
    this.leadingIcon,
    this.leadingIconColor,
    this.trailingIcon,
    this.trailingIconColor,
    this.isLoading = false,
  });

  factory AppButton.primary({
    Key? key,
    required AppButtonSize size,
    double? width,
    double? height,
    double? horizontalMargin,
    bool fitToText = false,
    bool isDisabled = false,
    VoidCallback? onTap,
    String? label,
    TextStyle? labelStyle,
    String? leadingIcon,
    Color? leadingIconColor,
    String? trailingIcon,
    Color? trailingIconColor,
    bool isLoading = false,
  }) {
    return AppButton._(
      key: key,
      type: AppButtonType.primary,
      size: size,
      width: width,
      height: height,
      horizontalMargin: horizontalMargin,
      fitToText: fitToText,
      isDisabled: isDisabled,
      onTap: onTap,
      label: label,
      labelStyle: labelStyle,
      leadingIcon: leadingIcon,
      leadingIconColor: leadingIconColor,
      trailingIcon: trailingIcon,
      trailingIconColor: trailingIconColor,
      isLoading: isLoading,
    );
  }

  factory AppButton.neutral({
    Key? key,
    required AppButtonSize size,
    double? width,
    double? height,
    double? horizontalMargin,
    bool fitToText = false,
    bool isDisabled = false,
    VoidCallback? onTap,
    String? label,
    TextStyle? labelStyle,
    String? leadingIcon,
    Color? leadingIconColor,
    String? trailingIcon,
    Color? trailingIconColor,
    bool isLoading = false,
  }) {
    return AppButton._(
      key: key,
      type: AppButtonType.neutral,
      size: size,
      width: width,
      height: height,
      horizontalMargin: horizontalMargin,
      fitToText: fitToText,
      isDisabled: isDisabled,
      onTap: onTap,
      label: label,
      labelStyle: labelStyle,
      leadingIcon: leadingIcon,
      leadingIconColor: leadingIconColor,
      trailingIcon: trailingIcon,
      trailingIconColor: trailingIconColor,
      isLoading: isLoading,
    );
  }

  factory AppButton.tertiary({
    Key? key,
    required AppButtonSize size,
    double? width,
    double? height,
    double? horizontalMargin,
    bool fitToText = false,
    bool isDisabled = false,
    VoidCallback? onTap,
    String? label,
    TextStyle? labelStyle,
    String? leadingIcon,
    Color? leadingIconColor,
    String? trailingIcon,
    Color? trailingIconColor,
    bool isLoading = false,
  }) {
    return AppButton._(
      key: key,
      type: AppButtonType.tertiary,
      size: size,
      width: width,
      height: height,
      horizontalMargin: horizontalMargin,
      fitToText: fitToText,
      isDisabled: isDisabled,
      onTap: onTap,
      label: label,
      labelStyle: labelStyle,
      leadingIcon: leadingIcon,
      leadingIconColor: leadingIconColor,
      trailingIcon: trailingIcon,
      trailingIconColor: trailingIconColor,
      isLoading: isLoading,
    );
  }

  factory AppButton.danger({
    Key? key,
    required AppButtonSize size,
    double? width,
    double? height,
    double? horizontalMargin,
    bool fitToText = false,
    bool isDisabled = false,
    VoidCallback? onTap,
    String? label,
    TextStyle? labelStyle,
    String? leadingIcon,
    Color? leadingIconColor,
    String? trailingIcon,
    Color? trailingIconColor,
    bool isLoading = false,
  }) {
    return AppButton._(
      key: key,
      type: AppButtonType.danger,
      size: size,
      width: width,
      height: height,
      horizontalMargin: horizontalMargin,
      fitToText: fitToText,
      isDisabled: isDisabled,
      onTap: onTap,
      label: label,
      labelStyle: labelStyle,
      leadingIcon: leadingIcon,
      leadingIconColor: leadingIconColor,
      trailingIcon: trailingIcon,
      trailingIconColor: trailingIconColor,
      isLoading: isLoading,
    );
  }

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  late bool isHovered;
  late bool isActive;

  @override
  void initState() {
    isHovered = false;
    isActive = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        setState(() {
          isActive = false;
        });
        if (!widget.isDisabled && !widget.isLoading) {
          if (widget.onTap != null) {
            widget.onTap!();
          }
        }
      },
      onTapDown: (details) {
        setState(() {
          isActive = true;
        });
      },
      onTapCancel: () {
        setState(() {
          isActive = false;
        });
      },
      child: MouseRegion(
        onHover: (event) => setState(() {
          if (!(Platform.isAndroid || Platform.isIOS)) {
            isHovered = true;
          }
        }),
        onExit: (event) => setState(() {
          if (!(Platform.isAndroid || Platform.isIOS)) {
            isHovered = false;
          }
        }),
        child: Container(
          height: widget.height ?? _heightFromSize(widget.size),
          width: widget.fitToText ? null : widget.width,
          alignment: widget.fitToText ? null : Alignment.center,
          padding: _paddingFromSize(widget.size),
          margin:
              EdgeInsets.symmetric(horizontal: widget.horizontalMargin ?? 0),
          decoration: BoxDecoration(
            color: _colorFromType(widget.type),
            borderRadius: BorderRadius.circular(100),
            border: _borderFromType(widget.type),
          ),
          child: widget.isLoading
              ? SizedBox(
                  // <-- Change according to design after design is completed
                  width: _loadingIndicatorSizeFromButtonSize(),
                  height: _loadingIndicatorSizeFromButtonSize(),
                  child: FittedBox(
                    child: CircularProgressIndicator(
                      color: _contentColor(widget.type),
                    ),
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.leadingIcon != null) ...[
                      Image.asset(
                        widget.leadingIcon!,
                        width: _iconWidthFromSize(widget.size),
                        height: _iconHeightFromSize(widget.size),
                        color: widget.isDisabled
                            ? AppTheme.colors(context).disabledContent
                            : widget.leadingIconColor,
                      ),
                      if (widget.label != null)
                        SizedBox(width: AppDimens.small),
                    ],
                    if (widget.label != null)
                      Text(
                        widget.label!,
                        style: widget.labelStyle ??
                            _labelStyleFromType(widget.type),
                      ),
                    if (widget.trailingIcon != null) ...[
                      if (widget.label != null)
                        SizedBox(width: AppDimens.small),
                      Image.asset(
                        widget.trailingIcon!,
                        width: _iconWidthFromSize(widget.size),
                        height: _iconHeightFromSize(widget.size),
                        color: widget.isDisabled
                            ? AppTheme.colors(context).disabledContent
                            : widget.trailingIconColor,
                      ),
                    ],
                  ],
                ),
        ),
      ),
    );
  }

  double _loadingIndicatorSizeFromButtonSize() {
    switch (widget.size) {
      case AppButtonSize.small:
        return 18;
      case AppButtonSize.medium:
        return 20;
      case AppButtonSize.large:
        return 25;
    }
  }

  BoxBorder? _borderFromType(AppButtonType type) {
    switch (type) {
      case AppButtonType.primary:
        return null;
      case AppButtonType.neutral:
        return Border.all(
          width: 1,
          color: AppTheme.colors(context).border,
        );
      case AppButtonType.tertiary:
        return null;
      case AppButtonType.danger:
        return null;
    }
  }

  TextStyle _labelStyleFromType(AppButtonType type) {
    switch (widget.size) {
      case AppButtonSize.small:
        return AppTextStyles.l12(
          context,
          _contentColor(type),
        );
      case AppButtonSize.medium:
        return AppTextStyles.t14(
          context,
          _contentColor(type),
        );
      case AppButtonSize.large:
        return AppTextStyles.t14(
          context,
          _contentColor(type),
        );
    }
  }

  Color _contentColor(AppButtonType type) {
    if (widget.isDisabled) {
      return AppTheme.colors(context).disabledContent;
    }
    switch (type) {
      case AppButtonType.primary:
        return AppTheme.colors(context).backgroundLight;
      case AppButtonType.neutral:
        return AppTheme.colors(context).heading;
      case AppButtonType.tertiary:
        return AppTheme.colors(context).primary;
      case AppButtonType.danger:
        return AppTheme.colors(context).backgroundLight;
    }
  }

  double _iconWidthFromSize(AppButtonSize size) {
    switch (size) {
      case AppButtonSize.small:
        return 16;
      case AppButtonSize.medium:
        return 20;
      case AppButtonSize.large:
        return 20;
    }
  }

  double _iconHeightFromSize(AppButtonSize size) {
    switch (size) {
      case AppButtonSize.small:
        return 16;
      case AppButtonSize.medium:
        return 20;
      case AppButtonSize.large:
        return 20;
    }
  }

  double _heightFromSize(AppButtonSize size) {
    switch (size) {
      case AppButtonSize.small:
        return 36;
      case AppButtonSize.medium:
        return 44;
      case AppButtonSize.large:
        return 52;
    }
  }

  EdgeInsetsGeometry _paddingFromSize(AppButtonSize size) {
    switch (size) {
      case AppButtonSize.small:
        return EdgeInsets.symmetric(horizontal: AppDimens.medium);
      case AppButtonSize.medium:
        return EdgeInsets.symmetric(horizontal: AppDimens.medium);
      case AppButtonSize.large:
        return EdgeInsets.symmetric(horizontal: AppDimens.large);
    }
  }

  Color _colorFromType(AppButtonType type) {
    switch (type) {
      case AppButtonType.primary:
        return _primaryButtonColor();
      case AppButtonType.neutral:
        return _neutralButtonColor();
      case AppButtonType.tertiary:
        return _tertiaryButtonColor();
      case AppButtonType.danger:
        return _dangerButtonColor();
    }
  }

  Color _primaryButtonColor() {
    if (widget.isDisabled) {
      return AppTheme.colors(context).disabledBackground;
    }
    if (isActive) {
      return AppTheme.colors(context).primaryActive;
    }
    if (isHovered) {
      return AppTheme.colors(context).primaryHover;
    }
    return AppTheme.colors(context).primary;
  }

  Color _neutralButtonColor() {
    if (widget.isDisabled) {
      return AppTheme.colors(context).backgroundLight.withOpacity(0.01);
    }
    if (isActive) {
      return AppTheme.colors(context).highLightNeutralDark;
    }
    if (isHovered) {
      return AppTheme.colors(context).highLightNeutral;
    }
    return AppTheme.colors(context).backgroundLight.withOpacity(0.01);
  }

  Color _tertiaryButtonColor() {
    if (widget.isDisabled) {
      return AppTheme.colors(context).backgroundLight.withOpacity(0.01);
    }
    if (isActive) {
      return AppTheme.colors(context).highLightPrimaryDark;
    }
    if (isHovered) {
      return AppTheme.colors(context).highLightPrimary;
    }
    return AppTheme.colors(context).backgroundLight.withOpacity(0.01);
  }

  Color _dangerButtonColor() {
    if (widget.isDisabled) {
      return AppTheme.colors(context).disabledBackground;
    }
    if (isActive) {
      return AppTheme.colors(context).dangerActive;
    }
    if (isHovered) {
      return AppTheme.colors(context).dangerHover;
    }
    return AppTheme.colors(context).danger;
  }
}

enum AppButtonType {
  primary,
  neutral,
  tertiary,
  danger,
}

enum AppButtonSize {
  small,
  medium,
  large,
}
