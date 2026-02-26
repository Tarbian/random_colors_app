import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_colors_app/core/app_constants.dart';
import 'package:random_colors_app/presentation/cubits/random_color_state.dart';

/// Cubit that manages the random background color state.
class RandomColorCubit extends Cubit<RandomColorState> {
  final Random _random = Random();

  /// Creates a [RandomColorCubit] with an initial color state.
  RandomColorCubit() : super(RandomColorState.initial());

  /// Function that emits new color.
  void changeColor() {
    emit(
      RandomColorState(
        red: _random.nextInt(AppConstants.maxChannelBrightness),
        green: _random.nextInt(AppConstants.maxChannelBrightness),
        blue: _random.nextInt(AppConstants.maxChannelBrightness),
      ),
    );
  }
}
