import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_colors_app/core/app_constants.dart';

/// Card with color info texts on a semi-transparent rounded background.
class ColorInfoCard extends StatelessWidget {
  /// Creates a [ColorInfoCard].
  const ColorInfoCard({
    required this.color,
    required this.textColor,
    required this.red,
    required this.green,
    required this.blue,
    super.key,
  });

  /// Radix used to convert integer color values to hexadecimal.
  static const int radix = 16;

  /// Minimum length for each hex color channel (e.g. 2 -> FF).
  static const int pad = 2;

  /// Color from background.
  final Color color;

  /// Color used for all text inside the card.
  final Color textColor;

  /// Red channel value to display.
  final int red;

  /// Green channel value to display.
  final int green;

  /// Blue channel value to display.
  final int blue;

  String get _hex =>
      '#${red.toRadixString(radix).padLeft(pad, '0')}'
              '${green.toRadixString(radix).padLeft(pad, '0')}'
              '${blue.toRadixString(radix).padLeft(pad, '0')}'
          .toUpperCase();

  void _copyHex(BuildContext context) {
    Clipboard.setData(ClipboardData(text: _hex));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(AppConstants.hexCopiedText),
        duration: Duration(seconds: AppConstants.snackBarDurationSeconds),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: textColor.withValues(alpha: AppConstants.cardBackgroundOpacity),
        borderRadius: BorderRadius.circular(AppConstants.cardBorderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.cardPaddingHorizontal,
          vertical: AppConstants.cardPaddingVertical,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppConstants.titleText,
              style: AppConstants.titleStyle(textColor),
            ),
            const SizedBox(height: AppConstants.verticalSpaceSmall),
            Text(
              'RGB($red, $green, $blue)',
              style: AppConstants.rgbStyle(textColor),
            ),
            const SizedBox(height: AppConstants.verticalSpaceSmall),
            GestureDetector(
              onTap: () => _copyHex(context),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _hex,
                    style: AppConstants.rgbStyle(textColor),
                  ),
                  const SizedBox(width: AppConstants.horizontalSpaceSmall),
                  Icon(
                    Icons.copy,
                    size: AppConstants.copyIconSize,
                    color: textColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppConstants.verticalSpaceSmall),
            Text(
              AppConstants.hintText,
              style: AppConstants.hintStyle(textColor),
            ),
          ],
        ),
      ),
    );
  }
}
