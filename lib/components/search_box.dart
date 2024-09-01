import 'package:e_book_app/theme/colors.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  final void Function(String) onChanged;
  final void Function(String)? onSubmitted;
  final double width;
  final double height;

  const SearchBox(
      {super.key,
      required this.onChanged,
      this.onSubmitted,
      this.width = 300,
      this.height = 40});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          color: grey.withOpacity(0.25),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 3),
        child: TextField(
          controller: textEditingController,
          onChanged: widget.onChanged,
          onSubmitted: widget.onSubmitted,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search...",
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      textEditingController.text = "";
                    });
                  },
                  icon: const Icon(
                    Icons.clear_outlined,
                    size: 16,
                  ))),
        ),
      ),
    );
  }
}
