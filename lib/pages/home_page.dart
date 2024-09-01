import 'package:e_book_app/components/search_box.dart';
import 'package:e_book_app/components/shop_bag_with_message.dart';
import 'package:e_book_app/components/special_for_you.dart';
import 'package:e_book_app/json/home_json.dart';
import 'package:e_book_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final _logger = Logger();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _messageCount = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  void _onSearchBoxChange(value) {
    _logger.i("Search box input change: $value");
  }

  void _onSearchBoxSubmit(value) {
    _logger.i("Search box input submited: $value");
  }

  Widget getBody() {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hello, Sopheamen",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              CircleAvatar(
                foregroundImage: NetworkImage(profileUrl),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SearchBox(
                onChanged: _onSearchBoxChange,
                onSubmitted: _onSearchBoxSubmit,
                width: size.width * 0.8,
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
          const SizedBox(
            height: 15,
          ),
          getSectionQuote(),
          const SizedBox(
            height: 15,
          ),
          getReadyTodaySection(),
          const SizedBox(
            height: 15,
          ),
          const SpecialForYou(
              title: "Special for you", books: specialForYouJson),
        ],
      ),
    ));
  }

  Widget getReadyTodaySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Ready Today",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          height: 150,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
              color: primary,
              image: const DecorationImage(
                  image: NetworkImage(
                    readyToday,
                  ),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12)),
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Top 10 books for self-development",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ),
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          children: [
            ...tags.map((tag) {
              return Container(
                margin: const EdgeInsets.only(right: 10, top: 15),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                decoration: BoxDecoration(
                    color: tag['color'],
                    borderRadius: BorderRadius.circular(12)),
                child: Text(
                  tag['label'],
                  style: const TextStyle(color: white, fontSize: 12),
                ),
              );
            })
          ],
        ),
      ],
    );
  }

  Widget getSectionQuote() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: primary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12)),
      child: const Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Quote of the day",
              style: TextStyle(
                  fontSize: 17, height: 2, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "I'd rather have roses on the table than diamonds on the necks.",
            style: TextStyle(
                fontSize: 15, height: 1.5, fontWeight: FontWeight.w500),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Emma Goldman",
              style: TextStyle(
                  fontSize: 16, height: 2, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
