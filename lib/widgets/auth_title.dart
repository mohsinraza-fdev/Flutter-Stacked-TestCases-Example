import 'package:flutter/material.dart';
import 'package:flutter_stacked_testcases_example/shared/app_theme.dart';

import '../shared/app_text_styles.dart';

class AuthTitle extends StatelessWidget {
  final String text;
  final bool required;
  final AppTextStyleFunc style;
  final double? horizontalMargin;
  const AuthTitle({
    Key? key,
    required this.text,
    this.required = false,
    this.style = AppTextStyles.h24,
    this.horizontalMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalMargin ?? 0),
      child: RichText(
        text: TextSpan(
          text: text,
          style: style(
            context,
            AppTheme.colors(context).heading,
          ),
          children: <TextSpan>[
            if (required)
              TextSpan(
                text: ' *',
                style: style(
                  context,
                  AppTheme.colors(context).primary,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
