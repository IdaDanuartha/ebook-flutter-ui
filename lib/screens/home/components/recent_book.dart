import 'package:ebook_app/themes.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class RecentBook extends StatelessWidget {
  const RecentBook({
    super.key, required this.image, required this.title, required this.percent,
  });

  final String image;
  final String title;
  final int percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(color: borderColorRecentBook),
          borderRadius: const BorderRadius.all(
            Radius.circular(12)
          )
        ),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 90,
          ),
          const SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: semiBoldText14.copyWith(color: blackColor2),
              ),
              CircularPercentIndicator(
                radius: 50,
                lineWidth: 7,
                animation: true,
                percent: percent/100,
                progressColor: greenColor,
                reverse: true,
                circularStrokeCap: CircularStrokeCap.round,
              ),
              Text(
                '$percent% Completed',
                style: mediumText12.copyWith(color: greyColorRecentBook),
              )
            ],
          )
        ],
      ),
    );
  }
}