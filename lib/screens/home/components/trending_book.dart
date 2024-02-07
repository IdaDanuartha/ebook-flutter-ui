import 'package:ebook_app/models/book.dart';
import 'package:ebook_app/screens/home/pages/book_details.dart';
import 'package:ebook_app/themes.dart';
import 'package:flutter/material.dart';

class TrendingBook extends StatelessWidget {
  const TrendingBook({
    super.key,
    required this.info
  });

  final BookList info;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, BookDetail.nameRoute);
          },
          child: Container(
            height: 160,
            width: 110,
            margin: const EdgeInsets.only(top: 12, right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(info.imageUrl),
                )
            ),
          ),
        ),
        const SizedBox(height: 8,),
        Text(info.writers, style: mediumText12.copyWith(color: greyColor),),
        Text(info.title, style: semiBoldText14.copyWith(color: blackColor),),
      ],
    );
  }
}