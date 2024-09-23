import 'package:flutter/material.dart';

class MoreLinkText extends StatelessWidget {
  final Widget goto;
  final String? title;
  final IconData? icon;
  final double? space;

  const MoreLinkText(
      {super.key, required this.goto, this.title, this.icon, this.space});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => goto));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title ?? "See all",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            width: space ?? 3,
          ),
          Icon(
            icon ?? Icons.arrow_forward_ios,
            size: 14,
          )
        ],
      ),
    );
  }
}
