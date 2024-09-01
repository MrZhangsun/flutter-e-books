import 'package:e_book_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final _logger = Logger();

class PlayNowPage extends StatefulWidget {
  final String img;
  final String price;
  final String title;
  final String subTitle;
  final String authorName;
  final double rate;
  final bool favourite;
  final int page;
  final String about;

  const PlayNowPage(
      {super.key,
      required this.img,
      required this.price,
      required this.title,
      required this.subTitle,
      required this.authorName,
      required this.rate,
      required this.favourite,
      required this.page,
      required this.about});

  @override
  State<PlayNowPage> createState() => _PlayNowPageState();
}

class _PlayNowPageState extends State<PlayNowPage> {
  late bool isPlaying;

  @override
  void initState() {
    super.initState();
    isPlaying = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: getAppBar()),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: AssetImage(widget.img), fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 15,
                        spreadRadius: 5,
                        color: black.withOpacity(0.2),
                        offset: const Offset(0, 10))
                  ]),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(
                  widget.subTitle,
                  style: TextStyle(color: black.withOpacity(0.6)),
                )
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      double maxWidth = constraints.maxWidth;
                      return Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 3,
                            decoration:
                                BoxDecoration(color: black.withOpacity(0.2)),
                          ),
                          Container(
                            width: maxWidth * 0.3,
                            height: 3,
                            decoration: const BoxDecoration(color: primary),
                          )
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "0:34:15",
                        style: TextStyle(
                            fontSize: 12, color: black.withOpacity(0.5)),
                      ),
                      Text(
                        "01:34:15",
                        style: TextStyle(
                            fontSize: 12, color: black.withOpacity(0.5)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.skip_previous_outlined,
                            color: primary,
                            size: 25,
                          )),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isPlaying = !isPlaying;
                              _logger.i("Is Playing: $isPlaying"); // 打印状态以确保更新
                            });
                          },
                          icon: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: primary),
                            child: Icon(
                              isPlaying
                                  ? Icons.play_arrow_outlined
                                  : Icons.pause_outlined,
                              size: 30,
                              color: white,
                            ),
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.skip_next_outlined,
                            color: primary,
                            size: 25,
                          )),
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: white,
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 22,
          )),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz,
              size: 22,
            ))
      ],
      title: const Text(
        "Playing Now",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
      ),
    );
  }
}
