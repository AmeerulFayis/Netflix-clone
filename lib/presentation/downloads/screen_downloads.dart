import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);
  final List imageList = [
    "http://www.themoviedb.org/t/p/w600_and_h900_bestv2/h32gl4a3QxQWNiNaR4Fc1uvLBkV.jpg",
    "http://www.themoviedb.org/t/p/w600_and_h900_bestv2/2mxnDbKCoR1M9e5szzc6Ku3Nfmv.jpg",
    "http://www.themoviedb.org/t/p/w600_and_h900_bestv2/uJYYizSuA9Y3DCs0qS4qWvHfZg4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: "Downloads",
        ),
      ),
      body: ListView(
        children: [
          Row(
            children: const [
              kWidth,
              Icon(
                Icons.settings,
                color: kWhiteColor,
              ),
              kWidth,
              Text("Smart Downloads")
            ],
          ),
          Text("Introducing Downloads for you"),
          Text(
            "We will download a personalised selection of movies and shows for you, so there is always something to watch on your device",
          ),
          Container(
            width: size.width,
            height: size.width,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: size.width * 0.37,
                ),
                DownloadsImageWidget(
                  imageList: imageList[0],
                  margin: EdgeInsets.only(left: 130, bottom: 50),
                  angle: 20,
                  size: Size(size.width * 0.4, size.width * 0.58),
                ),
                DownloadsImageWidget(
                  imageList: imageList[1],
                  margin: EdgeInsets.only(right: 130, bottom: 50),
                  angle: -20,
                  size: Size(size.width * 0.4, size.width * 0.58),
                ),
                DownloadsImageWidget(
                  imageList: imageList[2],
                  radius: 50,
                  margin: EdgeInsets.only(bottom: 10),
                  size: Size(size.width * 0.5, size.width * 0.65),
                ),
              ],
            ),
          ),
          MaterialButton(
            color: kButtonColorBlue,
            onPressed: () {},
            child: const Text(
              "Set up",
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          MaterialButton(
            color: kButtonColorWhite,
            onPressed: () {},
            child: const Text(
              "See what you can download",
              style: TextStyle(
                  color: kBlackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget(
      {Key? key,
      required this.imageList,
      this.angle = 0,
      required this.margin,
      required this.size,
      this.radius = 10})
      : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          margin: margin,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(imageList))),
        ),
      ),
    );
  }
}
