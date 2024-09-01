import 'package:e_book_app/components/search_box.dart';
import 'package:e_book_app/components/shop_bag_with_message.dart';
import 'package:e_book_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final _logger = Logger();

class MyBooksPage extends StatefulWidget {
  const MyBooksPage({super.key});

  @override
  State<MyBooksPage> createState() => _MyBooksPageState();
}

class _MyBooksPageState extends State<MyBooksPage> {
  int _messageCount = 0;

  void _onSearchBoxChange(value) {
    _logger.i("Search box input change: $value");
  }

  void _onSearchBoxSubmit(value) {
    _logger.i("Search box input submited: $value");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            getSearchBox(),
          ],
        ),
      ),
    ));
  }

  Widget getSearchBox() {
    return LayoutBuilder(
      builder: (context, constraints) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchBox(
            onChanged: _onSearchBoxChange,
            onSubmitted: _onSearchBoxSubmit,
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
