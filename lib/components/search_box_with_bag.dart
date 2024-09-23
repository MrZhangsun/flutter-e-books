import 'package:e_book_app/components/search_box.dart';
import 'package:flutter/material.dart';
import 'shop_bag_with_message.dart';
import 'package:logger/logger.dart';

final _logger = Logger();

class SearchBoxWithBag extends StatefulWidget {
  final void Function(String) onSearchBoxChange;
  final void Function(String) onSearchBoxSubmit;

  const SearchBoxWithBag(
      {super.key,
      required this.onSearchBoxChange,
      required this.onSearchBoxSubmit});

  @override
  State<SearchBoxWithBag> createState() => _SearchBoxWithBagState();
}

class _SearchBoxWithBagState extends State<SearchBoxWithBag> {
  int _messageCount = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchBox(
            onChanged: widget.onSearchBoxChange,
            onSubmitted: widget.onSearchBoxSubmit,
            width: constraints.maxWidth * 0.88,
            height: 40,
          ),
          ShopBagWithMessage(
            count: _messageCount,
            onPressed: () {
              setState(() {
                _messageCount++;
                _logger.i("Mock message count changed, $_messageCount");
              });
            },
          )
        ],
      ),
    );
  }
}
