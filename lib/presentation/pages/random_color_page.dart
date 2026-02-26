import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_colors_app/presentation/cubits/random_color_cubit.dart';
import 'package:random_colors_app/presentation/cubits/random_color_state.dart';
import 'package:random_colors_app/presentation/widgets/color_info_card.dart';

/// Page with random colors.
class RandomColorPage extends StatelessWidget {
  /// Creates a [RandomColorPage].
  const RandomColorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomColorCubit, RandomColorState>(
      builder: (context, state) {
        return Scaffold(
          body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => context.read<RandomColorCubit>().changeColor(),
            child: ColoredBox(
              color: state.color,
              child: Center(
                child: ColorInfoCard(
                  color: state.color,
                  textColor: state.textColor,
                  red: state.red,
                  green: state.green,
                  blue: state.blue,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
