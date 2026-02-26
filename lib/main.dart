import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_colors_app/presentation/cubits/random_color_cubit.dart';
import 'package:random_colors_app/presentation/pages/random_color_page.dart';

void main() {
  runApp(const Main());
}

/// Main page.
class Main extends StatelessWidget {
  /// Creates a [Main].
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => RandomColorCubit(),
        child: const RandomColorPage(),
      ),
    );
  }
}
