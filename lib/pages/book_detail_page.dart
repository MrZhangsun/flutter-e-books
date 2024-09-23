import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:e_book_app/components/circle_group.dart';
import 'package:e_book_app/components/special_for_you.dart';
import 'package:e_book_app/components/volume_bar.dart';
import 'package:e_book_app/json/home_json.dart';
import 'package:e_book_app/pages/contacts_page.dart';
import 'package:e_book_app/pages/play_now_page.dart';
import 'package:e_book_app/theme/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:logger/logger.dart';

final _logger = Logger();

class BookDetailPage extends StatefulWidget {
  final String img;
  final String price;
  final String title;
  final String subTitle;
  final String authorName;
  final double rate;
  final bool favourite;
  final int page;
  final String about;

  const BookDetailPage(
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
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(130), child: getAppBar()),
      body: getBody(),
    );
  }

  PreferredSizeWidget getAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      // elevation 属性用于控制 AppBar 的阴影深度
      elevation: 0,
      // backgroundColor: white,
      flexibleSpace: Stack(
        children: [
          // 背景图
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.img), fit: BoxFit.cover)),
          ),
          // 遮盖层
          Container(
            width: double.infinity,
            height: 180,
            color: black.withOpacity(0.2),
          ),
          // 模糊层
          BlurryContainer(
              height: 180, width: double.infinity, child: Container()),

          // 按钮层
          Container(
            width: double.infinity,
            height: 180,
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 22,
                        color: white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ContactsPage()));
                          },
                          icon: const Icon(
                            Icons.bookmark,
                            size: 22,
                            color: white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            getPlayNow();
                          },
                          icon: const Icon(
                            Icons.headphones,
                            size: 22,
                            color: white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            getBottomSheetSetting(context);
                          },
                          icon: const Icon(
                            Icons.settings,
                            size: 22,
                            color: white,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.only(top: 20),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                              color: white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ))),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.only(top: 8),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          widget.subTitle,
                          style: const TextStyle(
                            color: white,
                            fontSize: 16,
                          ),
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void getPlayNow() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PlayNowPage(
                img: widget.img,
                price: widget.price,
                title: widget.title,
                subTitle: widget.subTitle,
                authorName: widget.authorName,
                rate: widget.rate,
                favourite: widget.favourite,
                page: widget.page,
                about: widget.about)));
  }

  void getBottomSheetSetting(BuildContext context) {
    final List<DecorationFactor> themes = [
      DecorationFactor(color: const Color(0xFFFFFFFF)),
      DecorationFactor(color: const Color(0xFF000000)),
      DecorationFactor(color: const Color(0xFFF0CEA0)),
    ];

    final List<DecorationFactor> types = [
      DecorationFactor(text: "TT", color: primary),
      DecorationFactor(text: "Tt", color: primary)
    ];

    showMaterialModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              controller: ModalScrollController.of(context),
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(color: primary.withOpacity(0.15)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleGroup(
                            direction: Axis.horizontal,
                            decorationFactors: themes,
                          ),
                          CircleGroup(
                            direction: Axis.horizontal,
                            decorationFactors: types,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: VolumeBar(
                          progress: 0.5,
                          icon: Icons.light_mode,
                          volume: (volume) {
                            _logger.i(volume);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: VolumeBar(
                          progress: 0.5,
                          icon: Icons.format_size,
                          volume: (volume) {
                            _logger.i(volume);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

  Widget getBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            getOverviews(),
            getAbout(),
            getReviews(),
            const SizedBox(
              height: 15,
            ),
            getSimilarBooks()
          ],
        ),
      ),
    );
  }

  Widget getSimilarBooks() {
    return const SpecialForYou(title: "Similar Books", books: similarBooksJson);
  }

  Widget getReviews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 15),
          child: Text(
            "Reviews",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        ...reviewsPeople.map((people) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(people['img']),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            people['name'],
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          RatingBar.builder(
                              initialRating: people['rate'],
                              allowHalfRating: true,
                              itemSize: 14,
                              minRating: 1,
                              maxRating: 5,
                              itemCount: 5,
                              itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: danger,
                                  ),
                              onRatingUpdate: (rate) {
                                // 更新评分
                              })
                        ],
                      )
                    ],
                  ),
                ),
                RichText(
                    text: TextSpan(
                        text: people['text'],
                        style: const TextStyle(
                            color: black, fontWeight: FontWeight.w500),
                        children: [
                      TextSpan(
                          text: "more...",
                          style: const TextStyle(color: primary),
                          recognizer: TapGestureRecognizer()..onTap = () {})
                    ]))
              ],
            ))
      ],
    );
  }

  Widget getAbout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "About",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        RichText(
            text: TextSpan(
                text: widget.about,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: black,
                    height: 1.5),
                children: [
              TextSpan(
                  text: "more...",
                  style: const TextStyle(
                      color: primary,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      height: 1.5),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _logger.i("跳转小说阅读页面");
                    }),
            ])),
        const SizedBox(
          height: 15,
        ),
        Wrap(
          runSpacing: 10,
          alignment: WrapAlignment.start,
          children: [
            ...storeTags.map((tag) => Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: tag['color'],
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    tag['label'],
                    style: const TextStyle(fontSize: 12, color: white),
                  ),
                ))
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(profileUrl),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.authorName,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "1896-1940",
                        style: TextStyle(
                            fontSize: 12, color: black.withOpacity(0.5)),
                      )
                    ],
                  )
                ],
              ),
              TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        "32 Books",
                        style: TextStyle(
                            fontSize: 12, color: black.withOpacity(0.5)),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                      )
                    ],
                  ))
            ])
      ],
    );
  }

  Widget getOverviews() {
    const TextStyle valueTextStyle =
        TextStyle(fontSize: 17, fontWeight: FontWeight.w600);
    TextStyle labelTextStyle =
        TextStyle(fontSize: 14, color: black.withOpacity(0.5));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                "${widget.price}\$",
                style: valueTextStyle,
              ),
              Text(
                "Price",
                style: labelTextStyle,
              )
            ],
          ),
          Column(
            children: [
              Text(
                "${widget.page}",
                style: valueTextStyle,
              ),
              Text(
                "Pages",
                style: labelTextStyle,
              )
            ],
          ),
          Column(
            children: [
              Text(
                "${widget.rate}",
                style: valueTextStyle,
              ),
              Text(
                "Rating",
                style: labelTextStyle,
              )
            ],
          ),
        ],
      ),
    );
  }
}
