import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

double screenWidth(BuildContext context, {double multiplier = 1}) => MediaQuery.of(context).size.width * multiplier;
double screenHeight(BuildContext context, {double multiplier = 1}) => MediaQuery.of(context).size.height * multiplier;
double statusBarHeight(BuildContext context) => MediaQuery.of(context).padding.top;
bool isKeyboardOpen(BuildContext context) => MediaQuery.of(context).viewInsets.bottom > 10;

String durationToMMSS(Duration duration) {
  return '${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}';
}

logJson(dynamic json) {
  if (!kDebugMode) return;
  const JsonEncoder encoder = JsonEncoder.withIndent('  ');
  final String prettyString = encoder.convert(json);
  log(prettyString);
}
