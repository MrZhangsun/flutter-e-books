import 'package:e_book_app/theme/colors.dart';
import 'package:flutter/material.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getFooter() {
    return Container();
  }
}
