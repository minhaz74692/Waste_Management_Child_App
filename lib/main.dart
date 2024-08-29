// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(WasteManagementApp());
}

class WasteManagementApp extends StatelessWidget {
  const WasteManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WasteManagementScreen(),
    );
  }
}

class WasteManagementScreen extends StatelessWidget {
  WasteManagementScreen({super.key});

  final List<Map<String, dynamic>> titleList = [
    {"title": "আবর্জনা সংগ্রহ", "image": "assets/wc.png"},
    {"title": "আবর্জনা পরিবহন", "image": "assets/wt.png"},
    {"title": "আবর্জনা প্রক্রিয়াজাতকরণ", "image": "assets/wp.png"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // color: Colors.green,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  end: Alignment(0.98, -0.19),
                  begin: Alignment(-0.98, 0.19),
                  colors: [Color(0xFF1A512E), Color(0xFF63A91F)],
                ),
              ),
              child: SafeArea(
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'বর্জ্য ব্যবস্থাপনা',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 16),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/wm.png",
                                height: 130,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 192.0,
                          autoPlay: true,
                          enlargeCenterPage: true,
                        ),
                        items: titleList.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(.25),
                                  borderRadius: BorderRadius.circular(8),
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     color: Colors.black26,
                                  //     blurRadius: 4,
                                  //     offset: Offset(0, 2),
                                  //   ),
                                  // ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      i["title"],
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 8),
                                    Container(
                                      width: 140,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.asset(
                                          i["image"],
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),

                  Text(
                    'বর্জ্য ব্যবস্থাপনা বলতে আবর্জনা সংগ্রহ, পরিবহন, প্রক্রিয়াজাতকরণের প্রক্রিয়াকে বুঝায়।',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'ফেলে দেয়া বা অব্যাহৃত বস্তুকে বর্জ্য বলা হয়।অর্থাৎ কোনো বস্তু যখন আর ব্যাবহার করা যায় না কিন্তু স্থান দখল করে থাকে এবং অনেক ক্ষেত্রে মানুষ বা পশুপাখি এবং পরিবেশের জন্য ক্ষতিকর হয় তাকে বর্জ্য বলে।',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'বর্জ্যের উৎস ও শেষ গন্তব্য অনুযায়ী বর্জ্যকে বিভিন্ন শ্রেনীতে ভাগ করা যায়:',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  buildCategoryCard(
                    context,
                    'কঠিন বর্জ্য বা অপচনশীল বর্জ্য',
                    [
                      'পুরাতন কাপড়',
                      'কাচ সিরামিক',
                      'প্লাস্টিক বোতল',
                      'প্লাস্টিকের ভাংগা জিনিস',
                      'ইত্যাদি',
                    ],
                    "assets/sw.png",
                    false,
                  ),
                  SizedBox(height: 16),
                  buildCategoryCard(
                    context,
                    'গৃহস্থালী বর্জ্য বা পচনশীল বর্জ্য',
                    [
                      'শাক সবজির খোসা',
                      'ফলমূল',
                      'ইত্যাদি যেগুলো পচে যায়',
                    ],
                    "assets/bw.png",
                    true,
                  ),
                  SizedBox(height: 16),
                  buildCategoryCard(
                    context,
                    'পুড়ানো বা আগুনে জ্বালানোর ভিত্তিতে বর্জ্যকে কয়েক প্রকারে ভাগ করা যায়',
                    [
                      'দহন যোগ্য',
                      'অদহনীয়',
                      'পূর্ণব্যাবহার যোগ্য',
                    ],
                    "assets/wburn.png",
                    false,
                  ),
                  SizedBox(height: 16),
                  buildCategoryCard(
                    context,
                    'ময়লা সংগ্রহের সুবিধার্থে ময়লাকে যেভাবে ভাগ করা হয়',
                    [
                      'গৃহস্থালী  আবর্জনা',
                      'বাণিজ্যিক এলাকার আবর্জনা',
                      'শিল্প এলাকার আবর্জনা',
                    ],
                    "assets/wc2.png",
                    true,
                  ),
                  SizedBox(height: 16),
                  // Center(
                  //   child: Text(
                  //     '© 2024 Waste Management Inc.',
                  //     style: TextStyle(fontSize: 14, color: Colors.grey),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryCard(BuildContext context, String title,
      List<String> items, String image, bool left) {
    return Container(
      // elevation: 1,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: .2,
            spreadRadius: .4,
            color: Colors.green,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                left
                    ? Image.asset(
                        image,
                        width: 110,
                      )
                    : SizedBox.shrink(),
                SizedBox(
                  width: left ? 10 : 0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    ...items.map((item) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 220,
                                child: Text(
                                  item,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  width: !left ? 10 : 0,
                ),
                !left
                    ? Image.asset(
                        image,
                        width: 110,
                      )
                    : SizedBox.shrink()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
