import 'package:e_book_app/theme/colors.dart';
import 'package:flutter/material.dart';

class BookList extends StatefulWidget {
  const BookList({super.key});

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: white,
        body: const SafeArea(
            child: Center(
                child: Text(
          "BookList",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ))));
  }
}
