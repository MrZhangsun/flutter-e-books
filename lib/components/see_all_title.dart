import 'package:e_book_app/components/see_all.dart';
import 'package:flutter/material.dart';

class SeeAllTitle extends StatelessWidget {
  final String title;
  final Widget goto;

  const SeeAllTitle({super.key, required this.title, required this.goto});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        MoreLinkText(
          goto: goto,
        )
      ],
    );
  }
}
