import 'package:e_book_app/components/search_box.dart';
import 'package:e_book_app/components/shop_bag_with_message.dart';
import 'package:e_book_app/json/my_book_json.dart';
import 'package:e_book_app/pages/book_detail_page.dart';
import 'package:e_book_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [getSearchBox(), getContinueReading(), getUnread()],
        ),
      ),
    ));
  }

  Widget getUnread() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Text(
          "Unread(${unReadJson.length})",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...unReadJson.map((item) => GestureDetector(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookDetailPage(
                                  img: item['img'],
                                  price: item['price'],
                                  title: item['title'],
                                  subTitle: item['sub_title'],
                                  authorName: item['author_name'],
                                  rate: item['rate'],
                                  favourite: item['favourite'],
                                  page: int.parse(item['page']),
                                  about: item['about'])))
                    },
                    child: Container(
                      height: 105,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 80,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(item['img']),
                                    fit: BoxFit.cover),
                                color: black.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                item['title'],
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                item['sub_title'],
                                style: TextStyle(
                                    fontSize: 13,
                                    color: black.withOpacity(0.4)),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RatingBar.builder(
                                      maxRating: 5,
                                      minRating: 1,
                                      itemCount: 5,
                                      itemSize: 13,
                                      allowHalfRating: true,
                                      direction: Axis.horizontal,
                                      wrapAlignment: WrapAlignment.start,
                                      initialRating: item['rate'],
                                      itemPadding:
                                          const EdgeInsets.only(right: 2),
                                      itemBuilder: (context, index) {
                                        return const Icon(
                                          Icons.star,
                                          color: danger,
                                        );
                                      },
                                      onRatingUpdate: (rating) {}),
                                  Text(
                                    "(${item['rate']})",
                                    style: const TextStyle(color: danger),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }

  Widget getContinueReading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Text(
          "Continue reading(${continueReadingJson.length})",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...continueReadingJson.map((item) => Container(
                    width: 120,
                    margin:
                        const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookDetailPage(
                                        img: item['img'],
                                        price: item['price'],
                                        title: item['title'],
                                        subTitle: item['sub_title'],
                                        authorName: item['author_name'],
                                        rate: item['rate'],
                                        favourite: item['favourite'],
                                        page: int.parse(item['page']),
                                        about: item['about'])))
                          },
                          child: Container(
                            height: 160,
                            decoration: BoxDecoration(
                                color: black.withOpacity(0.1),
                                image: DecorationImage(
                                    image: AssetImage(item['img']),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                        Text(
                          item['title'],
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Text(
                          item['sub_title'],
                          maxLines: 1,
                          style: TextStyle(
                              color: black.withOpacity(0.4),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: LayoutBuilder(
                                builder: (context, constraints) => Stack(
                                  children: [
                                    Container(
                                      height: 3,
                                      decoration: BoxDecoration(
                                          color: black.withOpacity(0.2)),
                                    ),
                                    Container(
                                      height: 3,
                                      width: item['percentage'] /
                                          100 *
                                          constraints.maxWidth,
                                      decoration:
                                          const BoxDecoration(color: primary),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${item['percentage']}%",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: black.withOpacity(0.4),
                                  letterSpacing: 0.01),
                            )
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        )
      ],
    );
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
