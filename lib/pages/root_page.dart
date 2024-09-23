import 'package:e_book_app/json/root_app_json.dart';
import 'package:e_book_app/pages/favourite_page.dart';
import 'package:e_book_app/pages/home_page.dart';
import 'package:e_book_app/pages/my_books_page.dart';
import 'package:e_book_app/pages/store_page.dart';
import 'package:e_book_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: currentIndex,
      children: const [
        HomePage(),
        Center(
          child: MyBooksPage(),
        ),
        Center(
          child: StorePage(),
        ),
        Center(
          child: FavouritePage(),
        ),
      ],
    );
  }

  Widget getFooter() {
    // return SalomonBottomBar(items: [
    //   ...rootAppJson.map((item) => SalomonBottomBarItem(

    //       icon: Icon(item['icon']), title: Text(item['text'])))
    // ]);

    return SalomonBottomBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: List.generate(
            rootAppJson.length,
            (index) => SalomonBottomBarItem(
                selectedColor: primary,
                icon: Icon(rootAppJson[index]['icon']),
                title: Text(rootAppJson[index]['text']))));
  }
}
