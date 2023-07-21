import 'package:flutter/material.dart';
import 'package:flutter_stacked_testcases_example/constants/app_dimens.dart';
import 'package:flutter_stacked_testcases_example/shared/app_theme.dart';
import 'package:flutter_stacked_testcases_example/shared/helpers.dart';

class BaseAuthMobileScaffold extends StatelessWidget {
  final Widget? header;
  final Widget? body;
  final Widget? footer;
  final VoidCallback? onBack;
  const BaseAuthMobileScaffold({
    Key? key,
    this.header,
    this.body,
    this.footer,
    this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppTheme.colors(context).backgroundLight,
        body: Column(
          children: [
            SizedBox(height: statusBarHeight(context)),
            SizedBox(height: AppDimens.medium),
            Container(
              height: 48,
              color: Colors.transparent,
              alignment: Alignment.center,
              child: Row(
                children: [
                  SizedBox(width: AppDimens.medium),
                  // AppBackButton(
                  //   onTap: onBack ?? () => AppNavigator.pop(),
                  // ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  header ?? const SizedBox.shrink(),
                  Expanded(
                    child: body ?? const SizedBox.shrink(),
                  ),
                  footer ?? const SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
