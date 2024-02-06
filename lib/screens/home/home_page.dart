import 'package:ebook_app/themes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/profile-pic.png')
                )
              ),
            ),
            SizedBox(width: 8),
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
            Spacer(),
            Image.asset(
              "assets/icons/icon-menu.png",
              width: 18,
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 30
            ),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30)
              )
            ),
            child: Column(children: [
              header()
            ],),
          )
        ],
      )      
    );
  }
}