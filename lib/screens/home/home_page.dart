import 'package:ebook_app/models/book.dart';
import 'package:ebook_app/screens/home/components/recent_book.dart';
import 'package:ebook_app/screens/home/components/trending_book.dart';
import 'package:ebook_app/themes.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatefulWidget {
  static const nameRoute = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _categories = [
    'All Books',
    'Comic',
    'Novel',
    'Manga',
    'Fairy Tales',
  ];

  int _isSelected = 0;
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/images/profile-pic.png'))),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello Danuartha,",
                  style: semiBoldText16,
                ),
                Text(
                  "Good morning",
                  style: regularText14.copyWith(color: greyColor),
                )
              ],
            ),
            const Spacer(),
            Image.asset(
              "assets/icons/icon-menu.png",
              width: 18,
            )
          ],
        ),
      );
    }

    Widget searchField() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: TextField(
          decoration: InputDecoration(
              hintText: "Find your favorite book...",
              hintStyle: mediumText12.copyWith(color: greyColor),
              fillColor: greyColorSearchField,
              filled: true,
              border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              contentPadding: const EdgeInsets.all(18),
              suffixIcon: InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: greenColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: Icon(
                    Icons.search_rounded,
                    color: whiteColor,
                  ),
                ),
              )),
        ),
      );
    }

    Widget recentBook() {
      return const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            RecentBook(
              image: "assets/images/recentbook_1.png",
              title: "The Magic",
              percent: 50,
            ),
            SizedBox(width: 20),
            RecentBook(
              image: "assets/images/recentbook_2.png",
              title: "The Martian",
              percent: 75,
            ),
            SizedBox(width: 20),
            RecentBook(
              image: "assets/images/recentbook_1.png",
              title: "Big Four",
              percent: 28,
            ),
          ],
        ),
      );
    }

    Widget categories(int index) {
      return InkWell(
        onTap: () {
          setState(() {
            _isSelected = index;
          });
        },
        child: Container(
          margin: const EdgeInsets.only(top: 30, right: 12),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          decoration: BoxDecoration(
              color: _isSelected == index ? greenColor : transparentColor,
              borderRadius: BorderRadius.circular(6)),
          child: Text(_categories[index],
              style: semiBoldText14.copyWith(
                  color: _isSelected == index ? whiteColor : greyColor)),
        ),
      );
    }

    Widget listCategories() {
      return SingleChildScrollView(
        padding: const EdgeInsets.only(left: 30),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _categories
              .asMap()
              .entries
              .map((MapEntry map) => categories(map.key))
              .toList(),
        ),
      );
    }

    Widget trendingBook() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: bookLists
              .asMap()
              .entries
              .map((MapEntry map) => TrendingBook(info: bookLists[map.key],))
              .toList(),
        ),
      );
    }

    return Scaffold(
        body: ListView(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 30),
          decoration: BoxDecoration(
              color: whiteColor,
              borderRadius:
                  const BorderRadius.only(bottomLeft: Radius.circular(30))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              const SizedBox(height: 30),
              searchField(),
              const SizedBox(height: 30),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Recent Book",
                    style: semiBoldText16.copyWith(color: blackColor),
                  )),
              const SizedBox(height: 12),
              recentBook(),
            ],
          ),
        ),
        listCategories(),
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 30),
          child: Text(
            "Trending Now",
            style: semiBoldText16.copyWith(color: blackColor),
          ),
        ),
        trendingBook(),
        const SizedBox(height: 30,)
      ],
    ));
  }
}
