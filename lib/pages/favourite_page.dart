import 'package:e_book_app/components/book_overview.dart';
import 'package:e_book_app/components/search_box_with_bag.dart';
import 'package:e_book_app/json/favourite_json.dart';
import 'package:e_book_app/theme/colors.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  void _onSearchBoxChange(String text) {}

  void _onSearchBoxSubmit(String text) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SearchBoxWithBag(
                    onSearchBoxChange: _onSearchBoxChange,
                    onSearchBoxSubmit: _onSearchBoxSubmit),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  children: [
                    ...favouriteBooksJson.map((item) {
                      Map<String, Object> copy = Map.of(item);
                      copy['favourite'] = true;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: BookOverview(
                          item: copy,
                        ),
                      );
                    })
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
