import 'package:e_book_app/theme/colors.dart';
import 'package:flutter/material.dart';

class CircleGroup extends StatelessWidget {
  final List<DecorationFactor> decorationFactors;
  final int activeIndex;
  final double radius;
  final Axis direction;
  final double activeRadius;

  const CircleGroup(
      {super.key,
      this.direction = Axis.horizontal,
      required this.decorationFactors,
      this.activeIndex = 0,
      this.activeRadius = 20,
      this.radius = 15});

  @override
  Widget build(BuildContext context) {
    if (direction == Axis.horizontal) {
      return Row(
        children: generate(),
      );
    }

    return Column(
      children: generate(),
    );
  }

  List<Widget> generate() {
    return List.generate(decorationFactors.length, (index) {
      Color? color = decorationFactors[index].color;
      String text = decorationFactors[index].text;

      double height = radius * 2;
      if (index == activeIndex) {
        height = activeRadius * 2;
      }

      return Container(
        margin: direction == Axis.horizontal
            ? const EdgeInsets.symmetric(horizontal: 6)
            : const EdgeInsets.symmetric(vertical: 6),
        height: height,
        width: height,
        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: black.withOpacity(0.7), width: 0.5)),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        )),
      );
    });
  }
}

class DecorationFactor {
  final Color? color;
  final String text;

  DecorationFactor({this.color, this.text = ""});
}
