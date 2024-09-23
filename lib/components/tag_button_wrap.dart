import 'package:flutter/material.dart';

class TagButtonWrap extends StatelessWidget {
  final List tags;
  final Color? textColor;
  final double? fontSize;
  const TagButtonWrap(
      {super.key, required this.tags, this.textColor, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
      children: [
        ...tags.map((tag) {
          return Container(
            margin: const EdgeInsets.only(right: 10, top: 15),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            decoration: BoxDecoration(
                color: tag['color'], borderRadius: BorderRadius.circular(12)),
            child: Text(
              tag['label'],
              style: TextStyle(
                  color: textColor ?? Colors.white, fontSize: fontSize ?? 12),
            ),
          );
        })
      ],
    );
  }
}
