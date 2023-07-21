import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_stacked_testcases_example/constants/app_images.dart';

import '../../constants/app_dimens.dart';
import '../../shared/app_text_styles.dart';
import '../../shared/app_theme.dart';

class AppInputField extends StatefulWidget {
  final AppInputFieldType fieldType;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? label;
  final String? hint;
  final String? error;
  final bool isDisabled;
  final bool required;
  final double? horizontalMargin;
  final Function(String)? onChanged;
  final VoidCallback? onFocusOut;
  final VoidCallback? onTap;

  const AppInputField._(
      {Key? key,
      required this.fieldType,
      required this.controller,
      required this.focusNode,
      this.label,
      this.hint,
      this.error,
      this.isDisabled = false,
      this.required = false,
      this.horizontalMargin,
      this.onChanged,
      this.onFocusOut,
      this.onTap})
      : super(key: key);

  factory AppInputField.text({
    Key? key,
    required TextEditingController controller,
    required FocusNode focusNode,
    String? label,
    String? hint,
    String? error,
    bool isDisabled = false,
    bool required = false,
    double? horizontalMargin,
    Function(String)? onChanged,
    VoidCallback? onFocusOut,
    VoidCallback? onTap,
  }) {
    return AppInputField._(
      key: key,
      fieldType: AppInputFieldType.text,
      controller: controller,
      focusNode: focusNode,
      label: label,
      hint: hint,
      error: error,
      isDisabled: isDisabled,
      required: required,
      horizontalMargin: horizontalMargin,
      onChanged: onChanged,
      onFocusOut: onFocusOut,
      onTap: onTap,
    );
  }

  factory AppInputField.password({
    Key? key,
    required TextEditingController controller,
    required FocusNode focusNode,
    String? label,
    String? hint,
    String? error,
    bool isDisabled = false,
    bool required = false,
    double? horizontalMargin,
    Function(String)? onChanged,
    VoidCallback? onFocusOut,
    VoidCallback? onTap,
  }) {
    return AppInputField._(
      key: key,
      fieldType: AppInputFieldType.password,
      controller: controller,
      focusNode: focusNode,
      label: label,
      hint: hint,
      error: error,
      isDisabled: isDisabled,
      required: required,
      horizontalMargin: horizontalMargin,
      onChanged: onChanged,
      onFocusOut: onFocusOut,
      onTap: onTap,
    );
  }

  factory AppInputField.description({
    Key? key,
    required TextEditingController controller,
    required FocusNode focusNode,
    String? label,
    String? hint,
    String? error,
    bool isDisabled = false,
    bool required = false,
    double? horizontalMargin,
    Function(String)? onChanged,
    VoidCallback? onFocusOut,
    VoidCallback? onTap,
  }) {
    return AppInputField._(
      key: key,
      fieldType: AppInputFieldType.description,
      controller: controller,
      focusNode: focusNode,
      label: label,
      hint: hint,
      error: error,
      isDisabled: isDisabled,
      required: required,
      horizontalMargin: horizontalMargin,
      onChanged: onChanged,
      onFocusOut: onFocusOut,
      onTap: onTap,
    );
  }

  factory AppInputField.search({
    Key? key,
    required TextEditingController controller,
    required FocusNode focusNode,
    String? label,
    String? hint,
    String? error,
    bool isDisabled = false,
    bool required = false,
    double? horizontalMargin,
    Function(String)? onChanged,
    VoidCallback? onFocusOut,
    VoidCallback? onTap,
  }) {
    return AppInputField._(
      key: key,
      fieldType: AppInputFieldType.search,
      controller: controller,
      focusNode: focusNode,
      label: label,
      hint: hint,
      error: error,
      isDisabled: isDisabled,
      required: required,
      horizontalMargin: horizontalMargin,
      onChanged: onChanged,
      onFocusOut: onFocusOut,
      onTap: onTap,
    );
  }

  @override
  State<AppInputField> createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {
  bool hidePassword = true;
  bool isHovered = false;

  @override
  void initState() {
    widget.focusNode.addListener(_focusListener);
    super.initState();
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_focusListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.isDisabled,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.horizontalMargin ?? 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != null) ...[
              Text(
                "${widget.label!}${widget.required ? '*' : ''}",
                style: AppTextStyles.c12(
                  context,
                  AppTheme.colors(context).heading,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: AppDimens.small),
            ],
            Stack(
              clipBehavior: Clip.none,
              children: [
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(widget.focusNode);
                    setState(() {});
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
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      height: _height(),
                      alignment: _alignment(),
                      padding:
                          _padding().add(EdgeInsets.all(2 - _borderSize())),
                      decoration: BoxDecoration(
                        color: widget.isDisabled
                            ? AppTheme.colors(context).disabledBackground
                            : AppTheme.colors(context).backgroundLight,
                        borderRadius: _borderRadius(),
                        border: Border.all(
                          width: _borderSize(),
                          color: _borderColor(),
                        ),
                        boxShadow: _boxShadow(),
                      ),
                      child: _fieldContents(),
                    ),
                  ),
                ),
                if (widget.onTap != null)
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: widget.onTap,
                      child: Container(
                        color: Colors.transparent,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
              ],
            ),
            if (widget.error != null)
              Text(
                widget.error!,
                style: AppTextStyles.b14(
                  context,
                  AppTheme.colors(context).danger,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _fieldContents() {
    switch (widget.fieldType) {
      case AppInputFieldType.text:
        return _textFieldContents();
      case AppInputFieldType.password:
        return _passwordFieldContents();
      case AppInputFieldType.description:
        return _descriptionFieldContents();
      case AppInputFieldType.search:
        return _searchFieldContents();
    }
  }

  Widget _textFieldContents() {
    return TextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      style: AppTextStyles.b14(
        context,
        widget.isDisabled
            ? AppTheme.colors(context).disabledContent
            : AppTheme.colors(context).heading,
      ),
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        isCollapsed: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        alignLabelWithHint: true,
        border: InputBorder.none,
        hintText: widget.hint,
        hintStyle: AppTextStyles.b14(
          context,
          AppTheme.colors(context).placeholder,
        ),
      ),
    );
  }

  Widget _passwordFieldContents() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            style: AppTextStyles.b14(
              context,
              widget.isDisabled
                  ? AppTheme.colors(context).disabledContent
                  : AppTheme.colors(context).heading,
            ),
            obscureText: hidePassword,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              isCollapsed: true,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              alignLabelWithHint: true,
              border: InputBorder.none,
              hintText: widget.hint,
              hintStyle: AppTextStyles.b14(
                context,
                AppTheme.colors(context).placeholder,
              ),
            ),
          ),
        ),
        // GestureDetector(
        //   onTap: () {
        //     setState(() {
        //       hidePassword = !hidePassword;
        //     });
        //   },
        //   child: Container(
        //     height: 36,
        //     width: 36,
        //     color: Colors.transparent,
        //     alignment: Alignment.center,
        //     child: Image.asset(
        //       hidePassword ? AppImages.showPassword : AppImages.hidePassword,
        //       width: 20,
        //       height: 20,
        //     ),
        //   ),
        // )
      ],
    );
  }

  Widget _descriptionFieldContents() {
    return TextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      maxLines: null,
      style: AppTextStyles.b14(
        context,
        widget.isDisabled
            ? AppTheme.colors(context).disabledContent
            : AppTheme.colors(context).heading,
      ),
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        isCollapsed: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        alignLabelWithHint: true,
        border: InputBorder.none,
        hintText: widget.hint,
        hintStyle: AppTextStyles.b14(
          context,
          AppTheme.colors(context).placeholder,
        ),
      ),
    );
  }

  Widget _searchFieldContents() {
    return TextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      style: AppTextStyles.b14(
        context,
        widget.isDisabled
            ? AppTheme.colors(context).disabledContent
            : AppTheme.colors(context).heading,
      ),
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        isCollapsed: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        alignLabelWithHint: true,
        border: InputBorder.none,
        hintText: widget.hint,
        hintStyle: AppTextStyles.b14(
          context,
          AppTheme.colors(context).placeholder,
        ),
      ),
    );
  }

  double _height() {
    if (widget.fieldType == AppInputFieldType.description) {
      return 160;
    }
    return 40;
  }

  AlignmentGeometry _alignment() {
    if (widget.fieldType == AppInputFieldType.description) {
      return Alignment.topLeft;
    }
    return Alignment.center;
  }

  EdgeInsetsGeometry _padding() {
    switch (widget.fieldType) {
      case AppInputFieldType.text:
        return const EdgeInsets.symmetric(horizontal: 16);
      case AppInputFieldType.password:
        return const EdgeInsets.only(left: 16, right: 8);
      case AppInputFieldType.description:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
      case AppInputFieldType.search:
        return const EdgeInsets.symmetric(horizontal: 16);
    }
  }

  List<BoxShadow> _boxShadow() {
    if (widget.error == null && widget.focusNode.hasFocus) {
      return <BoxShadow>[
        BoxShadow(
          color: AppTheme.colors(context).primary.withOpacity(0.3),
          spreadRadius: 2,
        )
      ];
    }
    if (widget.error != null && widget.focusNode.hasFocus) {
      return <BoxShadow>[
        BoxShadow(
          color: AppTheme.colors(context).danger.withOpacity(0.3),
          spreadRadius: 2,
        )
      ];
    }
    return <BoxShadow>[];
  }

  Color _borderColor() {
    if (widget.isDisabled) {
      return AppTheme.colors(context).border;
    }
    if (!isHovered && widget.error == null && !widget.focusNode.hasFocus) {
      return AppTheme.colors(context).border;
    }
    if (!isHovered && widget.error != null && !widget.focusNode.hasFocus) {
      return AppTheme.colors(context).danger;
    }
    if (!isHovered && widget.error == null && widget.focusNode.hasFocus) {
      return AppTheme.colors(context).primary;
    }
    if (!isHovered && widget.error != null && widget.focusNode.hasFocus) {
      return AppTheme.colors(context).danger;
    }
    if (isHovered && widget.error == null) {
      return AppTheme.colors(context).primary;
    }
    if (isHovered && widget.error != null) {
      return AppTheme.colors(context).danger;
    }
    return AppTheme.colors(context).border;
  }

  double _borderSize() {
    if (!widget.focusNode.hasFocus && !isHovered) {
      return 1;
    }
    return 2;
  }

  BorderRadius _borderRadius() {
    if (widget.fieldType == AppInputFieldType.search) {
      return BorderRadius.circular(100);
    }
    return BorderRadius.circular(12);
  }

  void _focusListener() {
    if (!widget.focusNode.hasFocus) {
      if (widget.onFocusOut != null) {
        widget.onFocusOut!();
      }
    }
    setState(() {});
  }
}

enum AppInputFieldType {
  text,
  password,
  description,
  search,
}
