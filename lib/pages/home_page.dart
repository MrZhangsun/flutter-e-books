import 'package:e_book_app/json/home_json.dart';
import 'package:e_book_app/theme/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
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
              Container(
                width: size.width * 0.8,
                height: 40,
                decoration: BoxDecoration(
                    color: grey.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(12)),
                child: const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 3),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Search..."),
                  ),
                ),
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
          getSpecialForYou(),
        ],
      ),
    ));
  }

  Widget getSpecialForYou() {
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
              ...specialForYouJson.map((item) => Container(
                    height: 160,
                    width: 120,
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                        color: blue,
                        image: DecorationImage(
                            image: AssetImage(item['img']), fit: BoxFit.cover)),
                  ))
            ],
          ),
        )
      ],
    );
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
