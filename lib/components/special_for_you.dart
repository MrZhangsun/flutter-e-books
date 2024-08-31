import 'package:e_book_app/pages/book_detail_page.dart';
import 'package:e_book_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';

class SpecialForYou extends StatelessWidget {
  final List books;
  const SpecialForYou({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return getSpecialForYou(context);
  }

  Widget getSpecialForYou(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Special for you",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "See all",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                )
              ],
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...books.map((item) => GestureDetector(
                    onTap: () {
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
                                  about: item['about'])));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(children: [
                          // 最底层
                          Container(
                            height: 160,
                            width: 120,
                            margin: const EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                // color: blue,
                                image: DecorationImage(
                                    image: AssetImage(item['img']),
                                    fit: BoxFit.cover)),
                          ),

                          // favoriate
                          Positioned(
                              top: 10,
                              right: 25,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: white,
                                child: Icon(
                                  item['favourite']
                                      ? LineIcons.heartAlt
                                      : LineIcons.heart,
                                  size: 20,
                                  color: danger,
                                ),
                              )),
                          Positioned(
                              top: 100,
                              child: Container(
                                width: 65,
                                height: 25,
                                decoration: const BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12))),
                                child: Center(
                                  child: Text(
                                    "\$${item['price']}",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: white),
                                  ),
                                ),
                              )),
                        ]),
                        Container(
                          width: 120,
                          margin: const EdgeInsets.only(top: 15),
                          child: Text(
                            item['title'],
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          width: 120,
                          margin: const EdgeInsets.only(top: 5),
                          child: Text(
                            item['sub_title'],
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 15, color: black.withOpacity(0.4)),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: 120,
                          child: Row(
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
                                  itemPadding: const EdgeInsets.only(right: 2),
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
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
