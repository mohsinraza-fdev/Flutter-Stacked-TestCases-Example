import 'package:flutter/material.dart';
import 'package:flutter_stacked_testcases_example/sign_in/views/sign_in_mobile_view.dart';
import 'package:flutter_stacked_testcases_example/widgets/core_responsive_builder.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CoreResponsiveBuilder(
      mobile: SignInMobileView(),
      tablet: SignInMobileView(),
      desktop: SignInMobileView(),
    );
  }
}
