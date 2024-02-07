import 'package:ebook_app/themes.dart';
import 'package:flutter/material.dart';

class BookDetail extends StatelessWidget {
  static const nameRoute = '/book/details';
  const BookDetail({super.key});

  @override
  Widget build(BuildContext context) {

    Widget header() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        margin: EdgeInsets.only(top: 30, bottom: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
                child: Icon(Icons.chevron_left_rounded, size: 30,)
            ),
            Text(
              "Book Details",
              style: semiBoldText20.copyWith(color: blackColor),
            ),
            Icon(Icons.share_outlined)
          ],
        ),
      );
    }

    Widget bookImage() {
      return Container(
        height: 267,
        width: 175,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/trending_book_1.png')
          )
        ),
      );
    }

    Widget saveButton() {
      return Positioned(
        top: 400,
        right: 30,
        child: Container(
          height: 50,
          width: 50,
          padding: EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: greenColor,
            shape: BoxShape.circle
          ),
          child: Image.asset('assets/icons/icon-save.png'),
        ),
      );
    }

    Widget buttonReadNow() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: greenColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            )
          ),
          child: Text("Read Now", style: semiBoldText20.copyWith(color: whiteColor),),
        ),
      );
    }

    Widget infoDescription() {
      return Container(
        height: 60,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: greyColorInfo,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("Rating", style: mediumText10.copyWith(color: dividerColor),),
                Text("4.8", style: semiBoldText12.copyWith(color: blackColor2),)
              ],
            ),
            VerticalDivider(color: dividerColor, thickness: 0.5),
            Column(
              children: [
                Text("Number of Pages", style: mediumText10.copyWith(color: dividerColor),),
                Text("180 Page", style: semiBoldText12.copyWith(color: blackColor2),)
              ],
            ),
            VerticalDivider(color: dividerColor, thickness: 0.5),
            Column(
              children: [
                Text("Language", style: mediumText10.copyWith(color: dividerColor),),
                Text("ENG", style: semiBoldText12.copyWith(color: blackColor2),)
              ],
            ),
          ],
        ),
      );
    }

    Widget description() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enchantment',
                        style: semiBoldText20.copyWith(color: blackColor2),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Guy Kawasaki',
                        style: mediumText14.copyWith(color: greyColor),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 5,),
                Text('Free Access', style: mediumText14.copyWith(
                  color: greenColor
                ),)
              ],
            ),
            SizedBox(height: 30,),
            Text(
              'Description',
              style: semiBoldText14.copyWith(color: greenColor),
            ),
            SizedBox(height: 6),
            Text(
              'Enchantment, as defined by bestselling business guru Guy Kawasaki, is not about manipulating people. It transform situations and relationship',
              style: regularText12.copyWith(color: greyColor),
            ),
            infoDescription(),
            buttonReadNow(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  header(),
                  bookImage(),
                  description(),
                ],
              ),
              saveButton()
            ]
          )
        ],
      ),
    );
  }
}
