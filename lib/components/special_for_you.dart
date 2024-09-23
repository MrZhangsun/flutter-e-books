import 'package:e_book_app/components/book_overview.dart';
import 'package:e_book_app/components/see_all_title.dart';
import 'package:e_book_app/pages/book_list.dart';
import 'package:flutter/material.dart';

class SpecialForYou extends StatelessWidget {
  final List books;
  final String title;
  const SpecialForYou({super.key, required this.title, required this.books});

  @override
  Widget build(BuildContext context) {
    return getSpecialForYou(context);
  }

  Widget getSpecialForYou(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SeeAllTitle(
          title: title,
          goto: const BookList(),
        ),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...books.map((item) => BookOverview(
                    item: item,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
