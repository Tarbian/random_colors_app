import 'package:flutter/material.dart';
import 'package:random_colors_app/core/app_constants.dart';

/// Holds the current RGB color values for the background.
class RandomColorState {
  /// Red channel intensity (0–255).
  final int red;

  /// Green channel intensity (0–255).
  final int green;

  /// Blue channel intensity (0–255).
  final int blue;

  /// Returns the [Color] built from the current RGB values.
  Color get color =>
      Color.fromARGB(AppConstants.alphaBackground, red, green, blue);

  /// Returns the [Color] of text depending on the background brightness.
  Color get textColor =>
      color.computeLuminance() > AppConstants.luminanceThreshold
      ? Colors.black
      : Colors.white;

  /// Creates a [RandomColorState] with the given RGB values.
  const RandomColorState({
    required this.red,
    required this.green,
    required this.blue,
  });

  /// Creates a [RandomColorState] with initial color from [AppConstants].
  factory RandomColorState.initial() => const RandomColorState(
    red: AppConstants.initialRChannelValue,
    green: AppConstants.initialGChannelValue,
    blue: AppConstants.initialBChannelValue,
  );
}
