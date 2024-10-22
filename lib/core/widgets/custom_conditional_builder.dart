import 'package:flutter/material.dart';

class CustomConditionalBuilder extends StatelessWidget {
  final bool condition;
  final WidgetBuilder builder;
  final WidgetBuilder? fallBack;

  const CustomConditionalBuilder(
      {super.key,
      required this.condition,
      required this.builder,
      this.fallBack});

  @override
  Widget build(BuildContext context) {
    if (condition) {
      return builder(context);
    }
    if (!condition && fallBack != null) {
      return fallBack!(context);
    }
    return const SizedBox.shrink();
  }
}
