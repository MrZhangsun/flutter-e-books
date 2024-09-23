import 'package:e_book_app/components/search_box_with_bag.dart';
import 'package:e_book_app/components/see_all_title.dart';
import 'package:e_book_app/components/special_for_you.dart';
import 'package:e_book_app/components/tag_button_wrap.dart';
import 'package:e_book_app/json/home_json.dart';
import 'package:e_book_app/json/store_json.dart';
import 'package:e_book_app/pages/book_list.dart';
import 'package:e_book_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final _logger = Logger();

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
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
      body: getBoday(),
    );
  }

  Widget getBoday() {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SearchBoxWithBag(
              onSearchBoxChange: _onSearchBoxChange,
              onSearchBoxSubmit: _onSearchBoxSubmit,
            ),
            const SizedBox(
              height: 10,
            ),
            getRecommendations(),
            const SizedBox(
              height: 10,
            ),
            getGenres(),
            const SizedBox(
              height: 10,
            ),
            getTrendingBooks(),
            const SizedBox(
              height: 10,
            ),
            getRecommendations(),
            const SizedBox(
              height: 10,
            ),
            getGenres(),
            const SizedBox(
              height: 10,
            ),
            getTrendingBooks(),
          ],
        ),
      ),
    ));
  }

  Widget getRecommendations() {
    return const SpecialForYou(
      title: "Recommendations",
      books: recommendationsList,
    );
  }

  Widget getTrendingBooks() {
    return const SpecialForYou(
      title: "Trending books",
      books: recommendationsList,
    );
  }

  Widget getGenres() {
    return const Column(
      children: [
        SeeAllTitle(
          title: "Genres",
          goto: BookList(),
        ),
        TagButtonWrap(tags: storeTags)
      ],
    );
  }
}
