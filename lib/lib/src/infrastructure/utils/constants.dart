import 'package:flutter/material.dart';

class Constants {
  static const double tinySpace = 2;
  static const double smallSpace = 4;
  static const double mediumSpace = 8;
  static const double largeSpace = 16;
  static const double xLargeSpace = 20;
  static const double xxLargeSpace = 24;
  static const double giantSpace = 32;

  static const SizedBox tinyVerticalSpacer = SizedBox(height: tinySpace);
  static const SizedBox smallVerticalSpacer = SizedBox(height: smallSpace);
  static const SizedBox mediumVerticalSpacer = SizedBox(height: mediumSpace);
  static const SizedBox largeVerticalSpacer = SizedBox(height: largeSpace);
  static const SizedBox xLargeVerticalSpacer = SizedBox(height: xLargeSpace);
  static const SizedBox xxLargeVerticalSpacer = SizedBox(height: xLargeSpace);
  static const SizedBox giantVerticalSpacer = SizedBox(height: giantSpace);

  static const SizedBox tinyHorizontalSpacer = SizedBox(width: tinySpace);
  static const SizedBox smallHorizontalSpacer = SizedBox(width: smallSpace);
  static const SizedBox mediumHorizontalSpacer = SizedBox(width: mediumSpace);
  static const SizedBox largeHorizontalSpacer = SizedBox(width: largeSpace);
  static const SizedBox xLargeHorizontalSpacer = SizedBox(width: xLargeSpace);
  static const SizedBox xxLargeHorizontalSpacer = SizedBox(width: xxLargeSpace);
  static const SizedBox giantHorizontalSpacer = SizedBox(width: giantSpace);

  static const EdgeInsetsDirectional tinyPadding =
      EdgeInsetsDirectional.all(tinySpace);
  static const EdgeInsetsDirectional smallPadding =
      EdgeInsetsDirectional.all(smallSpace);
  static const EdgeInsetsDirectional mediumPadding =
      EdgeInsetsDirectional.all(mediumSpace);
  static const EdgeInsetsDirectional largePadding =
      EdgeInsetsDirectional.all(largeSpace);
  static const EdgeInsetsDirectional giantPadding =
      EdgeInsetsDirectional.all(giantSpace);

  static const String iranSansFont = 'IranSans';
  static const String iranSansFaNumFont = 'IranSansFaNum';

  static width(
    final BuildContext context, {
    double? fraction,
  }) =>
      MediaQuery.of(context).size.width / (fraction ?? 1);

  static height(
    final BuildContext context, {
    double? fraction,
  }) =>
      MediaQuery.of(context).size.height / (fraction ?? 1);
}
